import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.to!(int[]);

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

  writeln(ai.to!(string[]).join(" "));
  writeln(c);
}
