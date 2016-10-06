import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;

  auto rd = readln.chomp.splitter;
  auto ai = new int[](n);
  foreach (i; n.iota) {
    ai[i] = rd.front.to!int;
    rd.popFront;
  }

  auto i = partition(ai, 0, n - 1);

  foreach (j, a; ai) {
    writef(i == j ? "[%d]" : "%d", a);
    if (j < n - 1) write(" ");
  }
  writeln;
}

size_t partition(ref int[] ai, size_t p, size_t r)
{
  auto x = ai[r];
  auto i = p - 1;

  foreach (j; p..r) {
    if (ai[j] <= x) {
      ++i;
      swap(ai[i], ai[j]);
    }
  }
  swap(ai[i + 1], ai[r]);

  return i + 1;
}
