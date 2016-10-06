import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto rd = readln.split.to!(size_t[]), n = rd[0], k = rd[1];
  auto wi = n.iota.map!(_ => readln.chomp.to!int).array;

  bool canCarry(int _, int p)
  {
    auto r = 1, c = 0;
    foreach (w; wi) {
      if (p < w) return false;
      if (p - c < w) {
        ++r; c = w;
      } else {
        c += w;
      }
    }
    return r <= k;
  }

  auto r = iota(1, wi.sum + 1).assumeSorted!(canCarry).upperBound(0);
  writeln(r.front);
}
