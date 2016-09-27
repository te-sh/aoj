import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  for (;;) {
    auto rd = readln.split.map!(to!int), m = rd[0], f = rd[1], r = rd[2];
    if (m == -1 && f == -1 && r == -1) break;

    if (m == -1 || f == -1)
      writeln("F");
    else if (m + f >= 80)
      writeln("A");
    else if (m + f >= 65 && m + f < 80)
      writeln("B");
    else if (m + f >= 50 && m + f < 65)
      writeln("C");
    else if (m + f >= 30 && m + f < 50) {
      if (r >= 50)
        writeln("C");
      else
        writeln("D");
    }
    else
      writeln("F");
  }
}
