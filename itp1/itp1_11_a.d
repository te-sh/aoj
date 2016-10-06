import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto di = readln.split.to!(int[]);
  auto si = readln.chomp;

  auto dice = new Dice(di);

  foreach (c; si)
    dice.roll(c);

  writeln(dice.top);
}

class Dice
{
  int[] di;

  this(int[] di)
  {
    this.di = di;
  }

  int top() { return di[0]; }

  void roll(char d)
  {
    auto rolled = ['N': [1, 5, 2, 3, 0, 4],
                   'E': [3, 1, 0, 5, 4, 2],
                   'S': [4, 0, 2, 3, 5, 1],
                   'W': [2, 1, 5, 0, 4, 3]];

    di = di.indexed(rolled[d]).array;
  }
}
