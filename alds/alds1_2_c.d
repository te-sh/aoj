import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.typecons;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.map!(rd => card(rd[0], rd[1..$].to!int)).array;

  auto bi = bubbleSort(ai, n);
  auto si = selectionSort(ai, n);

  writeln(bi.map!(a => a.suite.to!string ~ a.value.to!string).join(" "));
  writeln("Stable");
  writeln(si.map!(a => a.suite.to!string ~ a.value.to!string).join(" "));
  writeln(bi == si ? "Stable" : "Not stable");
}

card[] bubbleSort(card[] ai, size_t n)
{
  auto bi = ai.dup;
  foreach (i; 0..n)
    foreach_reverse (j; i+1..n)
      if (bi[j].value < bi[j-1].value)
        swap(bi[j], bi[j-1]);
  return bi;
}

card[] selectionSort(card[] ai, size_t n)
{
  auto bi = ai.dup;
  foreach (i; 0..n) {
    auto minJ = i;
    foreach (j; i..n)
      if (bi[j].value < bi[minJ].value)
        minJ = j;
    swap(bi[i], bi[minJ]);
  }
  return bi;
}

alias Tuple!(char, "suite", int, "value") card;
