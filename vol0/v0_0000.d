import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  foreach (i; 1..10)
    foreach (j; 1..10)
      writefln("%dx%d=%d", i, j, i * j);
}
