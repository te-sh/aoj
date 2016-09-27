import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!ptrdiff_t;
  auto ai = readln.split.map!(to!int).array;

  writeln(ai.map!(to!string).join(" "));

  foreach (i; 1..n) {
    auto v = ai[i];
    auto j = i - 1;
    for (; j >= 0 && ai[j] > v; --j)
      ai[j + 1] = ai[j];
    ai[j + 1] = v;
    writeln(ai.map!(to!string).join(" "));
  }
}
