import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto rd = readln.split.to!(size_t[]), n = rd[0], m = rd[1];
  auto aij = n.iota.map!(_ => readln.split.to!(int[])).array;
  auto bi = m.iota.map!(_ => readln.chomp.to!int).array;

  auto ci = new int[](n);
  foreach (i; 0..n)
    ci[i] = m.iota.map!(j => aij[i][j] * bi[j]).sum;

  ci.each!(writeln);
}
