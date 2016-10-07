import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

version(unittest) {} else
void main()
{
  string line;
  while ((line = readln) !is null) {
    auto rd = line.split.to!(real[]);
    auto a = rd[0], b = rd[1], c = rd[2];
    auto d = rd[3], e = rd[4], f = rd[5];

    auto g = a * e - b * d;
    auto x = (c * e - b * f);
    if (x.abs > 0) x /= g;
    auto y = (a * f - c * d);
    if (y.abs > 0) y /= g;
    x = (x * 1000).round / 1000;
    y = (y * 1000).round / 1000;

    writefln("%.3f %.3f", x, y);
  }
}
