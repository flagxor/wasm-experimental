#!/usr/bin/python

import argparse
import sys

def ParseArgs():
  parser = argparse.ArgumentParser(
description="""Convert from the "flat" text
assembly syntax emitted by LLVM into the s-expression syntax expected by
the spec repository. Perform fake linking so that symbols can be
resolved. This currently only works on single-file programs. Note: this is
a hack. A real linker will eventually be needed.""")
  parser.add_argument('-o', '--output', type=str, default=None,
                      help='output `.wasm` s-expression file')
  parser.add_argument('input', metavar='INPUT', nargs='?',
                      help='input `.wack` LLVM assembly file')
  return parser.parse_args()

def readInput(input_file):
  """Read LLVM input from the file specified, or stdin."""
  if input_file is None:
    return sys.stdin.read().splitlines()
  return open(input_file, 'rb').readlines()

out = ''
def writeOutput(string, newline=True):
  global out
  out = out + string + ('\n' if newline else '')

current_pass = None
current_line_number = 0
current_section = ".text"
current_function = None
current_label = None
current_function_number = 0
current_indent = ''
data_labels = {}
data_data = []
expr_stack = []
block_labels = {}

def error(message):
    sys.stderr.write('error at line ' + str(current_line_number) + ': ' +
                     message)
    sys.exit(1)

def push_label(label):
    if block_labels.has_key(label):
        block_labels[label] += 1
    else:
        block_labels[label] = 1

def align_data_to(align):
    while len(data_data) % align != 0:
        data_data.append(0)

def handle_dot_asciz(rest):
    if current_pass == 'data':
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

# Handle a dot directive, e.g '.foo'
def handle_dot_directive(command, args, rest):
    global current_function
    global current_function_number
    global current_section
    global current_indent
    if command == 'text':
        current_section = ".text"
    elif command == 'data':
        current_section = ".data"
    elif command in ['file', 'type']:
        pass
    elif command == 'globl':
        if current_pass == 'text':
            writeOutput(current_indent + '(export "' + args[0] + '" $' + args[0]
                        + ')')
    elif command == 'param':
        if current_pass == 'text':
            writeOutput(current_indent + '(param ' + args[0] + ')')
    elif command == 'result':
        if current_pass == 'text':
            writeOutput(current_indent + '(result ' + args[0] + ')')
    elif command == 'local':
        if current_pass == 'text':
            writeOutput(current_indent + '(local ' + ' '.join(args) + ')')
    elif command == 'size':
        if current_pass == 'text' and current_section == '.text':
            assert args[0] == current_function
            current_indent = current_indent[:-2]
            writeOutput(current_indent + ')')
            current_function = None
            current_function_number += 1
    elif command == 'int8':
        if current_pass == 'data':
            x = int(args[0])
            data_data.append(chr((x >> 0) & 255))
    elif command == 'int16':
        if current_pass == 'data':
            x = int(args[0])
            data_data.append(chr((x >> 0) & 255))
            data_data.append(chr((x >> 8) & 255))
    elif command == 'int32':
        if current_pass == 'data':
            x = int(args[0])
            data_data.append(chr((x >> 0) & 255))
            data_data.append(chr((x >> 8) & 255))
            data_data.append(chr((x >> 16) & 255))
            data_data.append(chr((x >> 24) & 255))
    elif command == 'int64':
        if current_pass == 'data':
            x = int(args[0])
            data_data.append(chr((x >> 0) & 255))
            data_data.append(chr((x >> 8) & 255))
            data_data.append(chr((x >> 16) & 255))
            data_data.append(chr((x >> 24) & 255))
            data_data.append(chr((x >> 32) & 255))
            data_data.append(chr((x >> 40) & 255))
            data_data.append(chr((x >> 48) & 255))
            data_data.append(chr((x >> 56) & 255))
    elif command == 'asciz':
        # Strings can contain embedded commas, so as a hack, pass the rest
        # of the line as a single argument.
        handle_dot_asciz(rest)
    elif command == 'align':
        if current_pass == 'data':
            align_data_to(1 << int(args[0]))
        elif current_section == '.text':
            error("TODO: implement .align for functions")
    elif command == 'lcomm':
        if current_pass == 'data':
            name = args[0]
            size = int(args[1])
            align = (1 << int(args[2]))
            align_data_to(align)
            handle_label(name, [])
            for i in range(0, size):
                data_data.append('\0')
    else:
        error("unknown dot command: ." + command)

# Handle a label definition, e.g 'foo:'
def handle_label(labelname, args):
    global current_function
    global current_indent
    global current_label
    if len(args) != 0:
        error("label with args")
    if current_pass == "text" and current_function != None:
        if labelname.startswith('func_end'):
            pass
        else:
            if block_labels.has_key(labelname):
                for i in range(0, block_labels[labelname]):
                    writeOutput(current_indent + ')')
            block_labels[labelname] = 0
            current_label = labelname
    elif current_pass == "text" and current_section == ".text":
        assert current_function == None
        current_function = labelname
        writeOutput(current_indent + '(func $' + labelname)
        current_indent += '  '
    elif current_pass == "data" and current_section == ".data":
        assert current_function == None
        data_labels[labelname] = len(data_data)

def resolve_label(arg):
    if arg[0] == '$' and data_labels.has_key(arg[1:]):
        return str(data_labels[arg[1:]])
    return arg

# Convert an instruction from mnemonic syntax to sexpr syntax.
def sexprify(command, args):
    s = '(' + command
    if len(args) != 0:
        s += ' '
    s += ' '.join([resolve_label(arg) for arg in args])
    s += ')'
    return s

# Handle an instruction mnemonic line.
def handle_mnemonic(command, args):
    # Hack: We don't know call signatures, so we don't know that void calls
    # don't push anything onto the stack.
    if (command != 'set_local' and len(expr_stack) != 0 and
        expr_stack[0].startswith('(call')):
        writeOutput(current_indent + expr_stack.pop())

    # TODO(jfb): fix this in llvm
    if command.endswith('return'):
      # change <type>.return -> return
      command = 'return'
    elif command.endswith('call'):
      # change <type>.call -> call
      command = 'call'
    elif command == 'brif':
      command = 'br_if'

    if command == 'block':
        writeOutput(current_indent + '(block ' + args[0])
        assert len(expr_stack) == 0
        push_label(args[0][1:]) # strip leading $
    elif command == 'loop':
        writeOutput(current_indent + '(loop $' + current_label)
        assert len(expr_stack) == 0
        push_label(args[0][1:]) # strip leading $
    elif command == 'set_local':
        assert args[1] == 'pop'
        writeOutput(current_indent + '(set_local ' + args[0] + ' ' +
                    expr_stack.pop() + ')')
        assert len(expr_stack) == 0
    elif (command in ['br_if', 'br', 'switch', 'return'] or
          command.endswith('store')):
        writeOutput(current_indent + sexprify(command, args))
        assert len(expr_stack) == 0
    elif command == 'call' and args[0] in ['$print_i32', '$print_f32',
                                           '$print_i64', '$print_f64']:
        expr_stack.append(sexprify('call_import', args))
    else:
        expr_stack.append(sexprify(command, args))

def Main():
  cmd_args = ParseArgs()
  all_lines = readInput(cmd_args.input)

  global current_indent
  global current_pass
  global current_line_number
  global current_section
  global current_label
  global block_labels

  # Open a module.
  writeOutput(current_indent + '(module')
  current_indent += '  '

  # Import what little we can.
  writeOutput(current_indent + '(import $print_i32 "stdio" "print" (param i32))')
  writeOutput(current_indent + '(import $print_f32 "stdio" "print" (param f32))')
  writeOutput(current_indent + '(import $print_i64 "stdio" "print" (param i64))')
  writeOutput(current_indent + '(import $print_f64 "stdio" "print" (param f64))')

  # Make two passes over the code: once to read all the data directives, and
  # then once to process all the text. This lets us resolve all the data
  # symbols so we can plug in absolute offsets into the text.
  for current_pass in ['data', 'text']:
    current_line_number = 0
    current_section = ".text"
    current_label = None
    block_labels = {}
    for line in all_lines:
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

      # Split out the first part of the line, which determines what we do.
      parts = line.split(None, 1)
      if len(parts) == 0:
        continue
      command = parts[0]
      if len(command) == 0:
        continue

      # The rest of the line is comma-separated args.
      if len(parts) > 1:
        rest = parts[1].strip()
        args = [x.strip() for x in rest.split(',')]
      else:
        rest = ''
        args = []

      # Decide what to do.
      if command[-1] == ':':
        handle_label(command[:-1], args)
      elif command[0] == '.':
        handle_dot_directive(command[1:], args, rest)
      elif current_pass == 'text':
        handle_mnemonic(command, args)

      current_line_number += 1

  # Print the data segment.
  writeOutput((current_indent + '(memory ' + str(len(data_data)) + ' ' +
               str(len(data_data))))
  current_indent += '  '
  writeOutput(current_indent + '(segment 0')
  current_indent += '  '
  writeOutput(current_indent + '"', newline=False)
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
    writeOutput(s, newline=False)

  writeOutput('"')
  current_indent = current_indent[:-2]
  writeOutput(current_indent + ')')
  current_indent = current_indent[:-2]
  writeOutput(current_indent + ')')

  # Close the module.
  current_indent = current_indent[:-2]
  writeOutput(current_indent + ')')

  # Check invariants.
  assert len(current_indent) == 0
  assert current_function == None

  if cmd_args.output == None:
    sys.stdout.write(out)
  else:
    with open(cmd_args.output, 'w') as outfile:
      outfile.write(out)


if __name__ == '__main__':
  sys.exit(Main())
