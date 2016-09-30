import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto h = readln.chomp.to!size_t;
  auto hi = readln.split.to!(int[]);
  hi = 0 ~ hi;

  buildMaxHeap(hi, h);

  foreach (i; 1..h+1)
    write(" ", hi[i]);
  writeln;
}

void maxHeapify(ref int[] ai, size_t h, size_t i)
{
  auto l = i * 2, r = l + 1;
  size_t largest;

  if (l <= h && ai[l] > ai[i])
    largest = l;
  else
    largest = i;
  if (r <= h && ai[r] > ai[largest])
    largest = r;

  if (largest != i) {
    swap(ai[i], ai[largest]);
    maxHeapify(ai, h, largest);
  }
}

void buildMaxHeap(ref int[] ai, size_t h)
{
  foreach_reverse(i; 1..h/2+1)
    maxHeapify(ai, h, i);
}
