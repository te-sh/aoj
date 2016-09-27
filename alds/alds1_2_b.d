import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto ai = readln.split.map!(to!int).array;

  auto c = 0;

  foreach (i; 0..n) {
    auto minJ = i;
    foreach (j; i..n) {
      if (ai[j] < ai[minJ])
        minJ = j;
    }
    if (i != minJ) {
      swap(ai[i], ai[minJ]);
      ++c;
    }
  }

  writeln(ai.map!(to!string).join(" "));
  writeln(c);
}
