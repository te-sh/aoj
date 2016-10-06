import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.uni;

version(unittest) {} else
void main()
{
  auto s = readln.chomp;
  writeln(s.map!(swapCase));
}

dchar swapCase(dchar c) {
  if (c.isLower) return c.toUpper;
  else if (c.isUpper) return c.toLower;
  else return c;
}

unittest
{
  assert(swapCase('a') == 'A');
  assert(swapCase('C') == 'c');
  assert(swapCase('1') == '1');
}
