import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  bool[string] di;

  foreach (_; n.iota) {
    auto rd = readln.chomp.splitter(' ');
    auto cmd = rd.front; rd.popFront;
    auto str = rd.front;
    switch (cmd) {
    case "insert":
      di[str] = true;
      break;
    case "find":
      writeln(str in di ? "yes" : "no");
      break;
    default:
      assert(0);
    }
  }
}
