import std.algorithm, std.conv, std.range, std.stdio, std.string;

enum St { None, Placed, Handed }

const auto n = 8;

void main()
{
  auto bij = new St[][](n, n);
  auto k = readln.chomp.to!size_t;
  foreach (_; k.iota) {
    auto rd = readln.split.to!(int[]);
    place(bij, rd[1], rd[0]);
  }

  tryPlace(bij, 0);

  foreach (bi; bij)
    writeln(bi.map!(b => b == St.Placed ? 'Q' : '.'));
}

bool tryPlace(St[][] bij, int y)
{
  if (y >= n) return true;
  if (!bij[y].canFind(St.Placed)) {
    foreach (x; 0..n) {
      if (bij[y][x] == St.Handed) continue;
      auto cij = bij.deepDup;
      place(cij, x, y);
      if (tryPlace(cij, y + 1)) {
        deepCopy(bij, cij);
        return true;
      }
    }
    return false;
  } else {
    return tryPlace(bij, y + 1);
  }
}

St[][] deepDup(St[][] bij)
{
  return bij.map!(bi => bi.dup).array;
}

void deepCopy(St[][] bij, St[][] cij)
{
  bij[][] = cij[][];
}

void place(St[][] bij, int x, int y)
{
  bij[y][x] = St.Placed;
  hand(bij, x-1, y-1, -1, -1);
  hand(bij, x  , y-1,  0, -1);
  hand(bij, x+1, y-1, +1, -1);
  hand(bij, x+1, y  , +1,  0);
  hand(bij, x+1, y+1, +1, +1);
  hand(bij, x  , y+1,  0, +1);
  hand(bij, x-1, y+1, -1, +1);
  hand(bij, x-1, y  , -1,  0);
}

void hand(St[][] bij, int x, int y, int dx, int dy)
{
  if (x < 0 || x >= n || y < 0 || y >= n) return;
  bij[y][x] = St.Handed;
  hand(bij, x + dx, y + dy, dx, dy);
}
