import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  for (;;) {
    auto rd = readln.split.to!(int[]), h = rd[0], w = rd[1];
    if (h == 0 && w == 0) break;
    foreach (i; 0..h) {
      foreach (j; 0..w)
        write((i + j) % 2 == 0 ? '#' : '.');
      writeln;
    }
    writeln;
  }
}
