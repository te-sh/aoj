import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto dij = n.iota.map!(_ => readln.split.to!(int[])).array;

  auto d0 = new Dice(dij[0]);
  dij = dij[1..$];

  auto rollings = ["", "T", "TT", "TTT",
                   "N", "NT", "NTT", "NTTT",
                   "W", "WT", "WTT", "WTTT",
                   "E", "ET", "ETT", "ETTT",
                   "S", "ST", "STT", "STTT",
                   "NN", "NNT", "NNTT", "NNTTT"];

  foreach (di; dij) {
    auto d1 = new Dice(di);
    foreach (r; rollings) {
      auto d2 = d1.dup;
      d2.roll(r);

      if (d0.di == d2.di) {
        writeln("No");
        return;
      }
    }
  }

  writeln("Yes");
}

class Dice
{
  int[] di;

  this(int[] di)
  {
    this.di = di;
  }

  int top()   { return di[0]; }

  auto dup()
  {
    return new Dice(di.dup);
  }

  void roll(string si)
  {
    foreach (c; si) roll(c);
  }

  void roll(char d)
  {
    auto rolled = ['N': [1, 5, 2, 3, 0, 4],
                   'E': [3, 1, 0, 5, 4, 2],
                   'S': [4, 0, 2, 3, 5, 1],
                   'W': [2, 1, 5, 0, 4, 3],
                   'T': [0, 2, 4, 1, 3, 5]];

    di = di.indexed(rolled[d]).array;
  }
}
