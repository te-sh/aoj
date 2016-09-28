import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto r = 0;

 loop: foreach (_; n.iota) {
    auto a = readln.chomp.to!int;

    if (a == 2) {
      ++r;
      continue;
    }

    if (a % 2 == 0)
      continue;

    foreach (i; iota(3, a.to!real.sqrt.to!int + 1))
      if (a % i == 0)
        continue loop;

    ++r;
  }


  writeln(r);
}
