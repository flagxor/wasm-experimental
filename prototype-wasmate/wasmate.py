#!/usr/bin/python

import argparse
import cStringIO
import re
import sys

def ParseArgs():
  parser = argparse.ArgumentParser(
description="""Convert from the "flat" text
assembly syntax emitted by LLVM into the s-expression syntax expected by
the spec repository. Perform fake linking so that symbols can be
resolved. This currently only works on single-file programs. Note: this is
a hack. A real toolchain will eventually be needed.""")
  parser.add_argument('-o', '--output', type=str, default=None,
                      help='output `.wasm` s-expression file')
  parser.add_argument('input', metavar='INPUT', nargs='?',
                      help='input `.s` LLVM assembly file')
  return parser.parse_args()

def readInput(input_file):
  """Read LLVM input from the file specified, or stdin."""
  if input_file is None:
    return sys.stdin.read().splitlines()
  return open(input_file, 'rb').readlines()

class OutputWriter(object):
    def __init__(self):
        self.current_indent = ''
        self.dirty = False
        self.out = cStringIO.StringIO()

    def indent(self):
        assert not self.dirty
        self.current_indent += '  '

    def dedent(self):
        assert not self.dirty
        self.current_indent = self.current_indent[:-2]

    def write(self, text):
        if not self.dirty:
            self.out.write(self.current_indent)
        self.out.write(text)
        self.dirty = True

    def end_of_line(self):
        self.out.write('\n')
        self.dirty = False

    def write_line(self, text):
        assert not self.dirty
        self.write(text)
        self.end_of_line()

    def get_output(self):
        return self.out.getvalue()

out = OutputWriter()

current_line_number = 0
current_section = ".text"
current_function_number = 0
data_labels = {}
data_data = []
imports = []
import_funs = []
block_labels = {}

def error(message):
    sys.stderr.write('error at line ' + str(current_line_number) + ': ' +
                     message)
    sys.exit(1)

sig_element_match = re.compile(r'(\((param|result) ([^\)]+)\))')

# For functions with more than one parameter, LLVM is currently generating:
# (param i32) (param i32) (result i32)
# when it should really be generating:
# (param i32 i32) (result i32)
# Do some string manipulation to fix this, but make sure we will accept the
# correct input, too.
def massage_import(text):
    params = []
    results = []
    for _, which, types in sig_element_match.findall(text):
        # Accumulate the types being declared.
        if which == "param":
            params.extend(types.split())
        elif which == "result":
            results.extend(types.split())
        else:
            raise NotImplementedError(which)
    # Remove the original param and result declarations.
    text = sig_element_match.sub("", text).strip()
    # Recreate the params.
    if params:
        text = "%s (param %s)" % (text, " ".join(params))
    # Recreate the results.
    if results:
        text = "%s (result %s)" % (text, " ".join(results))
    return text

def register_import(i):
    i = massage_import(i)
    imports.append(i)
    import_funs.append(i[0:i.find(' ')])

def push_label(label):
    if block_labels.has_key(label):
        block_labels[label] += 1
    else:
        block_labels[label] = 1

def align_data_to(align):
    while len(data_data) % align != 0:
        data_data.append('\0')

def resolve_label(arg):
    if arg[0] == '$' and data_labels.has_key(arg[1:]):
        return str(data_labels[arg[1:]])
    return arg

def cleanup_line(line):
    # Traslate '# BB#0:' comments into proper BBx_0: labels. This hack is
    # needed because loops in LLVM output reference the block after the
    # loop, which LLVM doesn't emit a proper label for if it's only
    # reachable by fallthrough.
    if line.startswith('# BB#'):
        line = 'BB' + str(current_function_number) + '_' + line[5:]

    # Strip comments.
    x = line.find('#')
    if x != -1:
        line = line[0:x]
    return line.strip()

def parse_line(line):
    # Split out the first part of the line, which determines what we do.
    parts = line.split(None, 1)
    command = parts[0]

    # The rest of the line is comma-separated args.
    if len(parts) > 1:
        rest = parts[1]
        args = [x.strip() for x in rest.split(',')]
    else:
        rest = ''
        args = []

    return command, args, rest

class PassHandler(object):
    def begin_pass(self):
        pass

    def end_pass(self):
        pass

    def handle_label(self, labelname):
        pass

    def handle_mnemonic(self, command, args):
        pass

    def handle_dot_globl(self, args):
        pass

    def handle_dot_param(self, args):
        pass

    def handle_dot_result(self, args):
        pass

    def handle_dot_local(self, args):
        pass

    def handle_dot_size(self, args):
        pass

    def handle_dot_int8(self, args):
        pass

    def handle_dot_int16(self, args):
        pass

    def handle_dot_int32(self, args):
        pass

    def handle_dot_int64(self, args):
        pass

    def handle_dot_zero(self, args):
        pass

    def handle_dot_asciz(self, rest):
        pass

    def handle_dot_align(self, args):
        if current_section == '.text':
            error("TODO: implement .align for functions")

    def handle_dot_lcomm(self, args):
        pass

    def handle_dot_import(self, args):
        pass

class DataPassHandler(PassHandler):
    def handle_label(self, labelname):
        if current_section == ".data":
            data_labels[labelname] = len(data_data)

    def handle_dot_int8(self, args):
        x = int(args[0])
        data_data.append(chr((x >> 0) & 255))

    def handle_dot_int16(self, args):
        x = int(args[0])
        data_data.append(chr((x >> 0) & 255))
        data_data.append(chr((x >> 8) & 255))

    def handle_dot_int32(self, args):
        x = int(args[0])
        data_data.append(chr((x >> 0) & 255))
        data_data.append(chr((x >> 8) & 255))
        data_data.append(chr((x >> 16) & 255))
        data_data.append(chr((x >> 24) & 255))

    def handle_dot_int64(self, args):
        x = int(args[0])
        data_data.append(chr((x >> 0) & 255))
        data_data.append(chr((x >> 8) & 255))
        data_data.append(chr((x >> 16) & 255))
        data_data.append(chr((x >> 24) & 255))
        data_data.append(chr((x >> 32) & 255))
        data_data.append(chr((x >> 40) & 255))
        data_data.append(chr((x >> 48) & 255))
        data_data.append(chr((x >> 56) & 255))

    def handle_dot_zero(self, args):
        size = int(args[0])
        for i in range(size):
            data_data.append('\0')

    def handle_dot_asciz(self, rest):
        # Strip off the leading and trailing quotes.
        assert rest[0] == '"'
        assert rest[-1] == '"'
        s = rest[1:-1]
        i = 0
        while i < len(s):
            c = s[i]
            if c == '\\':
                i += 1
                c = s[i]
                if c == 'n':
                    data_data.append('\n')
                elif c == 't':
                    data_data.append('\t')
                elif c == '\\':
                    data_data.append('\\')
                elif c == '\'':
                    data_data.append('\\')
                else:
                    error("unsupported escape!")
            else:
                data_data.append(c)
            i = i + 1
        data_data.append('\0')

    def handle_dot_align(self, args):
        align_data_to(1 << int(args[0]))

    def handle_dot_lcomm(self, args):
        name = args[0]
        size = int(args[1])
        align = (1 << int(args[2]))
        align_data_to(align)
        self.handle_label(name)
        for i in range(0, size):
            data_data.append('\0')

class ImportsPassHandler(PassHandler):
    def end_pass(self):
        for i in imports:
            out.write_line('(import ' + i + ')')

    def handle_dot_import(self, args):
        register_import(args[0])

# Convert an instruction from mnemonic syntax to sexpr syntax.
def sexprify(command, args):
    s = '(' + command
    if len(args) != 0:
        s += ' '
    s += ' '.join([resolve_label(arg) for arg in args if arg != 'push'])
    s += ')'
    return s

class TextPassHandler(PassHandler):
    def __init__(self):
        self.expr_stack = []
        self.current_function = None
        self.current_label = None

    def end_pass(self):
        assert len(self.expr_stack) == 0
        assert self.current_function is None

    def handle_label(self, labelname):
        if current_section == ".text":
            if self.current_function is not None:
                # Label inside a function.
                if labelname.startswith('func_end'):
                    pass
                else:
                    if block_labels.has_key(labelname):
                        for i in range(0, block_labels[labelname]):
                            out.write_line(')')
                    block_labels[labelname] = 0
                    self.current_label = labelname
            else:
                # Label for a function.
                assert self.current_function is None
                self.current_function = labelname
                out.write_line('(func $' + labelname)
                out.indent()

    def handle_mnemonic(self, command, args):
        # TODO(binji): LLVM outputs types for some commands that shouldn't have
        # them. Fix this upstream.
        split = command.split('.')
        if len(split) == 2:
            if split[1] in ('call_indirect', 'memory_size',
                            'grow_memory', 'switch'):
                command = split[1]

        if command == 'block':
            out.write_line('(block ' + args[0])
            assert len(self.expr_stack) == 0
            push_label(args[0][1:]) # strip leading $
        elif command == 'loop':
            out.write_line('(loop $' + self.current_label)
            assert len(self.expr_stack) == 0
            push_label(args[0][1:]) # strip leading $
        elif command == 'set_local':
            assert args[1] == 'pop'
            out.write_line('(set_local ' + args[0] + ' ' +
                        self.expr_stack.pop() + ')')
            assert len(self.expr_stack) == 0
        elif (command in ['br_if', 'br', 'switch', 'return', 'grow_memory'] or
              'store' in command):
            assert 'push' not in args
            out.write_line(sexprify(command, args))
            assert len(self.expr_stack) == 0
        elif command == 'call' and args[0] in import_funs:
            line = sexprify('call_import', args)
            if 'push' in args:
                self.expr_stack.append(line)
            else:
                out.write_line(line)
        else:
            line = sexprify(command, args)
            if 'push' in args:
                self.expr_stack.append(line)
            else:
                out.write_line(line)

    def handle_dot_globl(self, args):
        # .globl statement could be declaring a name for either a global
        # variable or a function. We only want to export functions, so
        # filter out global variables.
        if args[0] not in data_labels:
            out.write_line('(export "' + args[0] + '" $' + args[0] + ')')

    def handle_dot_param(self, args):
        out.write_line('(param ' + args[0] + ')')

    def handle_dot_result(self, args):
        out.write_line('(result ' + args[0] + ')')

    def handle_dot_local(self, args):
        out.write_line('(local ' + ' '.join(args) + ')')

    def handle_dot_size(self, args):
        global current_function_number

        if current_section == '.text':
            assert args[0] == self.current_function
            # End of function body.
            out.dedent()
            out.write_line(')')
            self.current_function = None
            current_function_number += 1


def handle_dot_directive(handler, command, args, rest):
    global current_function_number
    global current_section

    if command == 'text':
        current_section = ".text"
    elif command == 'data':
        current_section = ".data"
    elif command == 'imports':
      current_section = 'imports'
    elif command in ['file', 'type']:
        pass
    elif command == 'globl':
        handler.handle_dot_globl(args)
    elif command == 'param':
        handler.handle_dot_param(args)
    elif command == 'result':
        handler.handle_dot_result(args)
    elif command == 'local':
        handler.handle_dot_local(args)
    elif command == 'size':
        handler.handle_dot_size(args)
    elif command == 'int8':
        handler.handle_dot_int8(args)
    elif command == 'int16':
        handler.handle_dot_int16(args)
    elif command == 'int32':
        handler.handle_dot_int32(args)
    elif command == 'int64':
        handler.handle_dot_int64(args)
    elif command == 'zero':
        handler.handle_dot_zero(args)
    elif command == 'asciz':
        # Strings can contain embedded commas, so as a hack, pass the rest
        # of the line as a single argument.
        handler.handle_dot_asciz(rest)
    elif command == 'align':
        handler.handle_dot_align(args)
    elif command == 'lcomm':
        handler.handle_dot_lcomm(args)
    elif command == 'import':
        handler.handle_dot_import(args)
    else:
        error("unknown dot command: ." + command)

def do_pass(handler, all_lines):
    global current_line_number
    global current_section
    global block_labels

    current_line_number = 0
    current_section = ".text"
    block_labels = {}

    handler.begin_pass()

    for line in all_lines:
        line = cleanup_line(line)
        if not line:
            continue
        command, args, rest = parse_line(line)

        # Decide what to do.
        if command.endswith(':'):
            if args:
                error("label with args")
            handler.handle_label(command[:-1])
        elif command.startswith('.'):
            handle_dot_directive(handler, command[1:], args, rest)
        else:
            handler.handle_mnemonic(command, args)

        current_line_number += 1

    handler.end_pass()

def write_data_segment():
    out.write_line(('(memory ' + str(len(data_data)) + ' ' +
                 str(len(data_data))))
    out.indent()
    out.write_line('(segment 0')
    out.indent()
    out.write('"')
    for c in data_data:
        if c == '\n':
            s = '\\n'
        elif c == '\t':
            s = '\\t'
        elif c == '\\':
            s = '\\\\'
        elif c == '\'':
            s = '\\\''
        elif ord(c) >= 32 and ord(c) < 127:
            # ASCII printable
            s = c
        else:
          s = '\\%02x' % ord(c)
        out.write(s)

    out.write('"')
    out.end_of_line()
    out.dedent()
    out.write_line(')')
    out.dedent()
    out.write_line(')')

def Main():
  cmd_args = ParseArgs()
  all_lines = readInput(cmd_args.input)

  out.write_line(
""";; This file was generated by wasmate.py, which is a script that converts
;; from the \"flat\" text assembly syntax emitted by LLVM into the s-expression
;; syntax expected by the spec repository.
;;
;; Note: this is a hack. A real toolchain will eventually be needed.
;;
""")

  # Open a module.
  out.write_line('(module')
  out.indent()

  # Make three passes over the code: once to read all the data directives, once
  # to process all the text, and once for all the imports. This lets us resolve
  # all the data symbols so we can plug in absolute offsets into the text, while
  # having all the imports on top (which then lets us transform call to
  # call_import).
  do_pass(DataPassHandler(), all_lines)
  do_pass(ImportsPassHandler(), all_lines)
  do_pass(TextPassHandler(), all_lines)

  write_data_segment()

  # Close the module.
  out.dedent()
  out.write_line(')')

  # Check invariants.
  assert len(out.current_indent) == 0

  text = out.get_output()

  if cmd_args.output == None:
    sys.stdout.write(text)
  else:
    with open(cmd_args.output, 'w') as outfile:
      outfile.write(text)


if __name__ == '__main__':
  sys.exit(Main())
