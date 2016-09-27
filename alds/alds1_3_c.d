import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto dl = DList!long();

  foreach (_; 0..n) {
    auto rd = readln.splitter, cmd = rd.front; rd.popFront;
    switch (cmd) {
    case "insert":
      auto x = rd.front.to!long;
      dl.insertFront(x);
      break;
    case "delete":
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
