import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.bitmanip;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.to!(int[]);
  auto q = readln.chomp.to!size_t;
  auto mi = readln.split.to!(int[]);

  auto ri = new bool[](q);

  foreach (i; 0..1 << n) {
    auto s = ai.indexed(i.bitsSet).sum;
    foreach (j, m; mi)
      if (s == m) ri[j] = true;
  }

  foreach (r; ri)
    writeln(r ? "yes" : "no");
}
