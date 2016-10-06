import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto q = readln.chomp.to!size_t;

  foreach (_; q.iota) {
    auto x = readln.chomp, xl = x.length;
    auto y = readln.chomp, yl = y.length;

    auto memo = new int[][](xl + 1, yl + 1);
    foreach (i; 1..xl+1)
      foreach (j; 1..yl+1)
        if (x[i-1] == y[j-1])
          memo[i][j] = memo[i-1][j-1] + 1;
        else
          memo[i][j] = max(memo[i-1][j], memo[i][j-1]);

    writeln(memo[xl][yl]);
  }
}
