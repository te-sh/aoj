import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  for (;;) {
    auto rd = readln.split.map!(to!int), h = rd[0], w = rd[1];
    if (h == 0 && w == 0) break;
    foreach (_; 0..h)
      writeln('#'.repeat(w));
    writeln;
  }
}
