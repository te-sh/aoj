import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  for (;;) {
    auto x = readln.chomp;
    if (x == "0") break;
    writeln(x.to!(string[]).to!(int[]).sum);
  }
}
