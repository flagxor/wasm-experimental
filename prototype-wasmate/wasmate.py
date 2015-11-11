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
import_funs = []

def error(message, line_number=None):
    if line_number is None:
        line_number = current_line_number
    sys.stderr.write('error at line ' + str(line_number) + ': ' +
                     message + '\n')
    sys.exit(1)

def resolve_label(arg):
    if arg[0] == '$' and data_labels.has_key(arg[1:]):
        return str(data_labels[arg[1:]])
    return arg

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

def reduce_to_bytes(x, num_bytes):
    data = []
    while num_bytes > 0:
        data.append(chr(x & 255))
        x >>= 8
        num_bytes -= 1
    assert x == 0 or x == -1
    return data

class DataPassHandler(PassHandler):
    def __init__(self, data):
        self.data = data
        self.reloc = []

    def end_pass(self):
        # Fix up relocations.
        for pos, num_bytes, symbol, line_number in self.reloc:
            if symbol in data_labels:
                b = reduce_to_bytes(data_labels[symbol], num_bytes)
                self.data[pos:pos + num_bytes] = b
            else:
                error("can't resolve symbol %r" % symbol, line_number)

    def align_data_to(self, align):
        while len(self.data) % align != 0:
            self.data.append('\0')

    def handle_label(self, labelname):
        if current_section == ".data":
            data_labels[labelname] = len(self.data)

    def handle_dot_intx(self, arg, num_bytes):
        try:
            x = int(arg)
        except ValueError:
            # It's a symbol, fix it up later.
            x = 0
            self.reloc.append((len(self.data), num_bytes, arg, current_line_number))
        self.data.extend(reduce_to_bytes(x, num_bytes))

    def handle_dot_int8(self, args):
        self.handle_dot_intx(args[0], 1)

    def handle_dot_int16(self, args):
        self.handle_dot_intx(args[0], 2)

    def handle_dot_int32(self, args):
        self.handle_dot_intx(args[0], 4)

    def handle_dot_int64(self, args):
        self.handle_dot_intx(args[0], 8)

    def handle_dot_zero(self, args):
        size = int(args[0])
        for i in range(size):
            self.data.append('\0')

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
                    self.data.append('\n')
                elif c == 't':
                    self.data.append('\t')
                elif c == '\\':
                    self.data.append('\\')
                elif c == '\'':
                    self.data.append('\\')
                else:
                    error("unsupported escape!")
            else:
                self.data.append(c)
            i = i + 1
        self.data.append('\0')

    def handle_dot_align(self, args):
        self.align_data_to(1 << int(args[0]))

    def handle_dot_lcomm(self, args):
        name = args[0]
        size = int(args[1])
        align = (1 << int(args[2]))
        self.align_data_to(align)
        self.handle_label(name)
        for i in range(0, size):
            self.data.append('\0')

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

class ImportsPassHandler(PassHandler):
    def __init__(self):
        self.imports = []

    def end_pass(self):
        for i in self.imports:
            out.write_line('(import ' + i + ')')

    def handle_dot_import(self, args):
        i = massage_import(args[0])
        self.imports.append(i)
        import_funs.append(i[0:i.find(' ')])

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
        self.ends_at_label = {}

    def close_block(self, label):
        out.dedent()
        out.write_line(')')

    def block_ends_at(self, block_label, end_label):
        if end_label not in self.ends_at_label:
            self.ends_at_label[end_label] = []
        self.ends_at_label[end_label].append(block_label)

    def end_pass(self):
        assert len(self.expr_stack) == 0
        assert self.current_function is None

    def handle_label(self, labelname):
        if current_section == ".text":
            if self.current_function is not None:
                # Check to see if we need to close any blocks.
                if labelname in self.ends_at_label:
                    # Multiple blocks and loops may end at a label.
                    ending = self.ends_at_label.pop(labelname)
                    while ending:
                        self.close_block(ending.pop())

                # Label inside a function.
                if labelname.startswith('func_end'):
                    pass
                else:
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
            # Blocks end at the label you jump to.
            label = args[0][1:] # strip leading $
            out.write_line('(block $' + label)
            out.indent()
            assert len(self.expr_stack) == 0
            self.block_ends_at(label, label)
        elif command == 'loop':
            # The label you jump to is before the loop, the label the loop ends
            # at is after the loop.
            # This creates an inconsistency between LLVM and sexprs where LLVM
            # declares "begin: loop $end ... end: ..." but sexprs declare
            # "(loop $begin ...)", the nature of the argument to the "loop"
            # command differs.
            label = args[0][1:] # strip leading $
            out.write_line('(loop $' + self.current_label)
            out.indent()
            assert len(self.expr_stack) == 0
            self.block_ends_at(self.current_label, label)
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
            assert not self.ends_at_label, self.ends_at_label
            # End of function body.
            self.close_block('$' + self.current_function)
            self.current_function = None
            current_function_number += 1

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

def handle_dot_directive(handler, command, args, rest):
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

    current_line_number = 0
    current_section = ".text"

    handler.begin_pass()

    for line in all_lines:
        current_line_number += 1 # First line is "1" in most editors.
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

    handler.end_pass()

def write_data_segment(data):
    out.write_line(('(memory ' + str(len(data)) + ' ' +
                 str(len(data))))
    out.indent()
    out.write_line('(segment 0')
    out.indent()
    out.write('"')
    for c in data:
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

  data = []

  # Make three passes over the code: once to read all the data directives, once
  # to process all the text, and once for all the imports. This lets us resolve
  # all the data symbols so we can plug in absolute offsets into the text, while
  # having all the imports on top (which then lets us transform call to
  # call_import).
  do_pass(DataPassHandler(data), all_lines)
  do_pass(ImportsPassHandler(), all_lines)
  do_pass(TextPassHandler(), all_lines)

  write_data_segment(data)

  # Close the module.
  out.dedent()
  out.write_line(')')

  # Check invariants.
  assert len(out.current_indent) == 0, out.get_output()

  text = out.get_output()

  if cmd_args.output == None:
    sys.stdout.write(text)
  else:
    with open(cmd_args.output, 'w') as outfile:
      outfile.write(text)


if __name__ == '__main__':
  sys.exit(Main())
