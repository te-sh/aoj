import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto rd = readln.split.map!(to!size_t), n = rd[0], m = rd[1], l = rd[2];
  auto aij = n.iota.map!(_ => readln.split.map!(to!long)).array;
  auto bij = m.iota.map!(_ => readln.split.map!(to!long)).array;

  auto cij = new long[][](n, l);
  foreach (i; 0..n)
    foreach (j; 0..l)
      cij[i][j] = m.iota.map!(k => aij[i][k] * bij[k][j]).sum;

  cij.each!(ci => ci.map!(to!string).join(" ").writeln);
}
