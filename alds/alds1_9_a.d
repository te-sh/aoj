import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto h = readln.chomp.to!size_t;
  auto hi = readln.split.to!(int[]);
  hi = 0 ~ hi;

  foreach (i; 1..h+1) {
    writef("node %d: key = %d, ", i, hi[i]);
    if (i / 2 > 0)
      writef("parent key = %d, ", hi[i / 2]);
    if (i * 2 <= h)
      writef("left key = %d, ", hi[i * 2]);
    if (i * 2 + 1 <= h)
      writef("right key = %d, ", hi[i * 2 + 1]);
    writeln;
  }
}
