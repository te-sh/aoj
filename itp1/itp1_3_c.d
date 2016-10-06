import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  for (;;) {
    auto rd = readln.split.to!(int[]);
    rd.sort();
    if (rd[0] == 0 && rd[1] == 0) break;
    writeln(rd.to!(string[]).join(" "));
  }
}
