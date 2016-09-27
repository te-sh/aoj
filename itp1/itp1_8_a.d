import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.uni;

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
