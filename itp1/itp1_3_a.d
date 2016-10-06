import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  foreach (_; 1000.iota)
    writeln("Hello World");
}
