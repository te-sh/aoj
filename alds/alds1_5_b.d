import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.to!(int[]);

  auto c = 0;
  mergeSort(ai, 0, n, c);

  writeln(ai.to!(string[]).join(" "));
  writeln(c);
}

void merge(ref int[] ai, size_t l, size_t m, size_t r, ref int c)
{
  auto li = ai[l..m].dup;
  auto ri = ai[m..r].dup;

  li ~= int.max;
  ri ~= int.max;

  auto i = 0, j = 0;
  foreach (k; l..r) {
    ++c;
    if (li[i] <= ri[j]) {
      ai[k] = li[i];
      ++i;
    } else {
      ai[k] = ri[j];
      ++j;
    }
  }
}

void mergeSort(ref int[] ai, size_t l, size_t r, ref int c)
{
  if (l + 1 < r) {
    auto m = (l + r) / 2;
    mergeSort(ai, l, m, c);
    mergeSort(ai, m, r, c);
    merge(ai, l, m, r, c);
  }
}
