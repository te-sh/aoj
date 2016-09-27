import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  for (;;) {
    auto rd = readln.split.map!(to!int), h = rd[0], w = rd[1];
    if (h == 0 && w == 0) break;
    foreach (i; 0..h)
      if (i == 0 || i == h - 1)
        writeln('#'.repeat(w));
      else
        writeln("#" ~ '.'.repeat(w - 2).to!string ~ "#");
    writeln;
  }
}
