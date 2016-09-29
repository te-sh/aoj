import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

void main()
{
  auto n = readln.chomp.to!int;

  auto s = point(0, 0);
  auto t = point(100, 0);

  auto ri = s ~ koch(s, t, n) ~ t;
  foreach (r; ri)
    writefln("%.5f %.5f", r.x, r.y);
}

point[] koch(point s, point t, int r)
{
  if (r == 0) return [];
  --r;

  auto u = s + (t - s) * (1.0 / 3);
  auto v = s + (t - s) * (2.0 / 3);
  auto w = u + (v - u).rot60;

  auto su = koch(s, u, r);
  auto uw = koch(u, w, r);
  auto wv = koch(w, v, r);
  auto vt = koch(v, t, r);

  return su ~ u ~ uw ~ w ~ wv ~ v ~ vt;
}

point rot60(point s)
{
  auto cos60 = 1.0 / 2;
  auto sin60 = 3.0.sqrt / 2;
  return point(s.x * cos60 - s.y * sin60, s.x * sin60 + s.y * cos60);
}

struct Point(T) {
  T x, y;

  point opBinary(string op)(point rhs) {
    static if (op == "+") return point(x + rhs.x, y + rhs.y);
    else static if (op == "-") return point(x - rhs.x, y - rhs.y);
  }

  point opBinary(string op)(T a) {
    static if (op == "*") return point(x * a, y * a);
  }
}

alias Point!real point;
