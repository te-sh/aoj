import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto rd = readln.split.to!(size_t[]), r = rd[0], c = rd[1];
  auto tij = r.iota.map!(_ => readln.split.to!(int[])).array;

  auto sij = new int[][](r + 1, c + 1);
  foreach (i; 0..r) sij[i][] = tij[i][] ~ 0;

  foreach (i; 0..r) sij[i][$-1] = tij[i].sum;
  foreach (j; 0..c) sij[$-1][j] = tij.transversal(j).sum;
  sij[$-1][$-1] = sij[$-1][0..c].sum;

  sij.each!(si => si.to!(string[]).join(" ").writeln);
}
