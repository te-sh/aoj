import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  for (;;) {
    auto rd = readln.split.to!(int[]).sort();
    if (rd[0] == 0 && rd[1] == 0) break;
    writeln(rd.to!(string[]).join(" "));
  }
}
