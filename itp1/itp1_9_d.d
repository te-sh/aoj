import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto str = readln.chomp.dup;
  auto q = readln.chomp.to!size_t;

  foreach (_; q.iota) {
    auto rd = readln.split, cmd = rd[0];
    auto a = rd[1].to!int, b = rd[2].to!int;

    switch (cmd) {
    case "print":
      writeln(str[a..b+1]);
      break;
    case "reverse":
      auto t = str[a..b+1];
      t.reverse();
      break;
    case "replace":
      auto p = rd[3];
      str[a..b+1][] = p[];
      break;
    default:
      assert(0);
    }
  }
}
