import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

void main()
{
  for (;;) {
    auto n = readln.chomp.to!size_t;
    if (n == 0) break;

    auto si = readln.split.map!(to!real).array;
    auto m = si.sum / n;
    auto sigma = si.map!(s => (s - m) ^^ 2).sum / n;
    writefln("%.5f", sqrt(sigma));
  }
}
