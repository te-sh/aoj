import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

void main()
{
  auto rd = readln.split.map!(to!real), a = rd[0], b = rd[1], t = rd[2];
  t = t * PI / 180;

  auto h = b * sin(t);
  auto s = a * h / 2;
  auto c = hypot(h, a - b * cos(t));

  writefln("%.5f", s);
  writefln("%.5f", a + b + c);
  writefln("%.5f", h);
}
