import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto fi = new int[](45);
  fi[0] = fi[1] = 1;

  foreach (i; 2..n+1)
    fi[i] = fi[i-1] + fi[i-2];

  writeln(fi[n]);
}
