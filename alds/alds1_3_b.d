import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container, std.typecons;

void main()
{
  auto rd1 = readln.split, n = rd1[0].to!size_t, q = rd1[1].to!int;
  auto qu = DList!process();
  foreach (_; n.iota) {
    auto rd2 = readln.split;
    qu.insertBack(process(rd2[0], rd2[1].to!int));
  }

  auto t = 0;
  while (!qu.empty) {
    auto p = qu.front; qu.removeFront;
    if (p.time > q) {
      t += q;
      qu.insertBack(process(p.name, p.time - q));
    } else {
      t += p.time;
      writefln("%s %d", p.name, t);
    }
  }
}

alias Tuple!(string, "name", int, "time") process;
