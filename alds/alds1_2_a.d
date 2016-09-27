import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.map!(to!int).array;

  auto flag = true, c = 0;
  while (flag) {
    flag = false;
    foreach_reverse (j; 1..n)
      if (ai[j] < ai[j - 1]) {
        swap(ai[j], ai[j - 1]);
        ++c;
        flag = true;
      }
  }

  writeln(ai.map!(to!string).join(" "));
  writeln(c);
}
