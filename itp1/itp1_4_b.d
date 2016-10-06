import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

version(unittest) {} else
void main()
{
  auto r = readln.chomp.to!real;
  writefln("%.6f %.6f", PI * r ^^ 2, 2 * PI * r);
}
