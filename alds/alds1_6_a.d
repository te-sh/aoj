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

  auto k = ai.reduce!(max);
  auto bi = countingSort(ai, k);

  foreach (i, b; bi) {
    write(b);
    if (i < n - 1) write(" ");
  }
  writeln;
}

int[] countingSort(int[] ai, int k)
{
  auto ci = new int[](k + 1);

  foreach (a; ai) ++ci[a];
  foreach (i; 1..k+1) ci[i] += ci[i - 1];

  auto bi = new int[](ai.length);

  foreach_reverse (a; ai) {
    bi[ci[a] - 1] = a;
    --ci[a];
  }

  return bi;
}
