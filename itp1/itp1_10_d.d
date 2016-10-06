import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto xi = readln.split.to!(real[]).array;
  auto yi = readln.split.to!(real[]).array;

  auto d1 = mincovskyDistance(xi, yi, 1);
  auto d2 = mincovskyDistance(xi, yi, 2);
  auto d3 = mincovskyDistance(xi, yi, 3);
  auto di = zip(xi, yi).map!(tp => (tp[0] - tp[1]).abs).reduce!(max);

  writefln("%.6f", d1);
  writefln("%.6f", d2);
  writefln("%.6f", d3);
  writefln("%.6f", di);
}

auto mincovskyDistance(real[] xi, real[] yi, real p)
{
  return zip(xi, yi).map!(tp => (tp[0] - tp[1]).abs ^^ p).sum ^^ (1 / p);
}
