import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto memo = new int[](51);
  foreach (i; 0..10)
    foreach (j; 0..10)
      ++memo[i + j];

  string line;
  while ((line = readln) !is null) {
    auto n = line.chomp.to!int;
    auto r = 0;
    foreach (i; 0..n+1)
      r += memo[i] * memo[n - i];
    writeln(r);
  }
}
