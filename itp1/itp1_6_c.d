import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;

  auto dat = new int[][][](4, 3, 10);
  foreach (_; n.iota) {
    auto rd = readln.split.to!(int[]);
    auto b = rd[0] - 1, f = rd[1] - 1, r = rd[2] - 1, v = rd[3];
    dat[b][f][r] += v;
  }

  foreach (i, b; dat) {
    foreach (f; b) {
      foreach (r; f)
        writef(" %d", r);
      writeln;
    }
    if (i < dat.length - 1)
      writeln("####################");
  }
}
