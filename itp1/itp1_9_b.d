import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  for (;;) {
    auto s = readln.chomp;
    if (s == "-") break;

    auto m = readln.chomp.to!size_t;
    auto hi = m.iota.map!(_ => readln.chomp.to!int);

    foreach (h; hi)
      s = s[h..$] ~ s[0..h];

    writeln(s);
  }
}
