import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

version(unittest) {} else
void main()
{
  auto rd = readln.split.to!(real[]);
  auto p1 = point(rd[0], rd[1]), p2 = point(rd[2], rd[3]);
  auto p = p1 - p2;
  writefln("%.5f", hypot(p.x, p.y));
}

struct Point(T) {
  T x, y;

  point opBinary(string op)(point rhs) {
    static if (op == "+") return point(x + rhs.x, y + rhs.y);
    else static if (op == "-") return point(x - rhs.x, y - rhs.y);
  }
}

alias Point!real point;
