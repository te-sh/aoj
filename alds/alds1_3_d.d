import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto s = readln.chomp;

  auto hi = new int[](s.length + 1);
  foreach (i, c; s)
    hi[i + 1] = hi[i] + c.predSwitch('\\', -1, '_', 0, '/', 1);
  auto maxH = hi.reduce!(max);

  auto fs1 = hi.findSplitBefore([maxH]), hiL = fs1[0], hiMR = fs1[1];

  hiMR.reverse();
  auto fs2 = hiMR.findSplitBefore([maxH]), hiR = fs2[0], hiM = fs2[1];

  auto aiL = hiL.calcAreas;
  auto aiM = hiM.calcAreas; aiM.reverse();
  auto aiR = hiR.calcAreas; aiR.reverse();
  auto ai = aiL ~ aiM ~ aiR;

  writeln(ai.sum);
  write(ai.length);
  ai.each!(a => write(" ", a));
  writeln;
}

int[] calcAreas(int[] hi)
{
  int[] areas;
  int maxH = int.min, area = 0;
  foreach (i, h; hi) {
    if (h < maxH) {
      area += 2 * (maxH - h) + hi[i - 1] - h;
    } else if (h == maxH) {
      if (area > 0) {
        areas ~= area / 2;
        area = 0;
      }
    } else {
      maxH = h;
    }
  }
  return areas;
}
