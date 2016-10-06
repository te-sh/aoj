import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  for (;;) {
    auto rd = readln.split, a = rd[0].to!int, op = rd[1], b = rd[2].to!int;
    if (op == "?") break;
    writeln(op.predSwitch("+", a + b, "-", a - b, "*", a * b, "/", a / b));
  }
}
