import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto ri = n.iota.map!(_ => readln.chomp.to!int).array;

  auto maxR = ri.back;
  auto maxP = int.min;

  foreach_reverse (i; 0..n-1) {
    maxP = max(maxP, maxR - ri[i]);
    maxR = max(maxR, ri[i]);
  }

  writeln(maxP);
}
