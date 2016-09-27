import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto s = readln.chomp;
  auto p = readln.chomp;

  foreach (i; 0..s.length)
    if ((s[i..$] ~ s[0..i]).canFind(p)) {
      writeln("Yes");
      return;
    }

  writeln("No");
}
