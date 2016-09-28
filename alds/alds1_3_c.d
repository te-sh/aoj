import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto dl = DList!long();

  foreach (_; n.iota) {
    auto rd = readln.chomp.splitter(' '), cmd = rd.front;
    switch (cmd) {
    case "insert":
      rd.popFront;
      auto x = rd.front.to!long;
      dl.insertFront(x);
      break;
    case "delete":
      rd.popFront;
      auto x = rd.front.to!long;
      auto r = dl[].find(x).take(1);
      if (!r.empty) dl.linearRemove(r);
      break;
    case "deleteFirst":
      dl.removeFront;
      break;
    case "deleteLast":
      dl.removeBack;
      break;
    default:
      assert(0);
    }
  }

  writeln(dl[].map!(to!string).join(" "));
}
