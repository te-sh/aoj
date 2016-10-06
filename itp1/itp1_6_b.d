import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;

  auto cards = new bool[](52);
  foreach (_; n.iota) {
    auto c = readln.chomp;
    cards[cardStoI(c)] = true;
  }

  foreach (int i, c; cards)
    if (!c) writeln(cardItoS(i));
}

int cardStoI(string c)
{
  auto rd = c.split;
  auto s = rd[0], r = rd[1].to!int;
  return s.predSwitch("S", 0, "H", 1, "C", 2, "D", 3) * 13 + r - 1;
}

unittest
{
  assert(cardStoI("S 1") == 0);
  assert(cardStoI("C 4") == 29);
}

string cardItoS(int c)
{
  auto s = c / 13, r = c % 13 + 1;
  return s.predSwitch(0, "S", 1, "H", 2, "C", 3, "D") ~ " " ~ r.to!string;
}

unittest
{
  assert(cardItoS(0) == "S 1");
  assert(cardItoS(29) == "C 4");
}
