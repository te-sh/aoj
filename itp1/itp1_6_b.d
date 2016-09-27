import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;

  auto cards = new bool[](52);
  foreach (_; 0..n) {
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

string cardItoS(int c)
{
  auto s = c / 13, r = c % 13 + 1;
  return s.predSwitch(0, "S", 1, "H", 2, "C", 3, "D") ~ " " ~ r.to!string;
}
