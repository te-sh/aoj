import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = n.iota.map!(_ => readln.chomp.to!int).array;

  auto gi = [1, 4, 13, 40, 121, 364, 1093, 3280, 9841, 29524, 88573, 265720, 797161];
  gi = gi.filter!(g => g <= n).array;
  gi.reverse();

  auto cnt = 0;

  shellSort(ai, n, gi, cnt);

  writeln(gi.length);
  writeln(gi.map!(to!string).join(" "));
  writeln(cnt);
  ai.each!(writeln);
}

void insertionSort(ref int[] ai, size_t n, int g, ref int cnt)
{
  foreach (ptrdiff_t i; g..n) {
    auto v = ai[i];
    auto j = i - g;
    for (; j >= 0 && ai[j] > v; j -= g) {
      ai[j + g] = ai[j];
      ++cnt;
    }
    ai[j + g] = v;
  }
}

void shellSort(ref int[] ai, size_t n, int[] gi, ref int cnt)
{
  foreach (g; gi)
    insertionSort(ai, n, g, cnt);
}
