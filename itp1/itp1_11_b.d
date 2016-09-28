import std.algorithm, std.conv, std.range, std.stdio, std.string;

const auto ri = [[-1, 2, 4, 1, 3,-1],
                 [ 3,-1, 0, 5,-1, 2],
                 [ 1, 5,-1,-1, 0, 4],
                 [ 4, 0,-1,-1, 5, 1],
                 [ 2,-1, 5, 0,-1, 3],
                 [-1, 3, 1, 4, 2,-1]];

void main()
{
  auto di = readln.split.to!(int[]);
  auto q = readln.chomp.to!size_t;

  foreach (_; q.iota) {
    auto rd = readln.split.to!(int[]), t = rd[0], f = rd[1];
    auto ti = di.countUntil(t), fi = di.countUntil(f);
    writeln(di[ri[ti][fi]]);
  }
}
