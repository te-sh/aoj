import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container;

void main()
{
  auto ai = new PriorityQueue!int(2_0000_000);

  for (;;) {
    auto rd = readln.chomp.splitter(' '), cmd = rd.front;
    switch (cmd) {
    case "insert":
      rd.popFront;
      ai.insert(rd.front.to!int);
      break;
    case "extract":
      writeln(ai.remove);
      break;
    case "end":
      return;
    default:
      assert(0);
    }
  }
}

class PriorityQueue(T)
{
  T[] buf;
  size_t t;

  this(size_t capacity)
  {
    buf = new T[](capacity);
    t = 1;
  }

  void insert(T val)
  {
    buf[t++] = val;
    goUp(t-1);
  }

  T remove()
  {
    T val = buf[1];
    buf[1] = buf[--t];
    goDown(1);
    return val;
  }

  void goUp(size_t i)
  {
    auto p = i / 2;
    if (p > 0 && buf[p] < buf[i]) {
      swap(buf[p], buf[i]);
      goUp(p);
    }
  }

  void goDown(size_t i)
  {
    auto l = i * 2, r = l + 1;
    size_t largest;

    if (l < t && buf[l] > buf[i])
      largest = l;
    else
      largest = i;
    if (r < t && buf[r] > buf[largest])
      largest = r;

    if (largest != i) {
      swap(buf[i], buf[largest]);
      goDown(largest);
    }
  }
}
