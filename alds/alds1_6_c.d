import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.typecons;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;

  auto ai = new card[](n);
  foreach (i; n.iota) {
    auto rd = readln.chomp.splitter(' ');
    auto suite = rd.front; rd.popFront;
    auto value = rd.front.to!int;
    ai[i] = card(suite, value);
  }
  auto bi = ai.dup;

  quicksort(ai, 0, n - 1);
  bi.sort!("a.value < b.value", SwapStrategy.stable);

  writeln(ai[] == bi[] ? "Stable" : "Not stable");
  foreach (a; ai)
    writefln("%s %d", a.suite, a.value);
}

size_t partition(ref card[] ai, size_t p, size_t r)
{
  auto x = ai[r];
  auto i = p - 1;

  foreach (j; p..r) {
    if (ai[j].value <= x.value) {
      ++i;
      swap(ai[i], ai[j]);
    }
  }
  swap(ai[i + 1], ai[r]);

  return i + 1;
}

void quicksort(ref card[] ai, size_t p, size_t r)
{
  if (p < r) {
    auto q = partition(ai, p, r);
    quicksort(ai, p, q - 1);
    quicksort(ai, q + 1, r);
  }
}

alias Tuple!(string, "suite", int, "value") card;
