import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto root = new RootNode!int;

  foreach (_; n.iota) {
    auto rd = readln.chomp.splitter(' '), cmd = rd.front;
    switch (cmd) {
    case "insert":
      rd.popFront;
      root.insert(rd.front.to!int);
      break;
    case "print":
      root.inorderWalk;
      root.preorderWalk;
      break;
    default:
      assert(0);
    }
  }
}

class Node(T)
{
  T key;
  Node l, r;

  this(T key)
  {
    this.key = key;
  }

  void insert(T val)
  {
    if (val < key) {
      if (l is null) l = new Node(val);
      else l.insert(val);
    } else {
      if (r is null) r = new Node(val);
      else r.insert(val);
    }
  }

  void inorderWalk()
  {
    if (l !is null) l.inorderWalk;
    write(" ", key);
    if (r !is null) r.inorderWalk;
  }

  void preorderWalk()
  {
    write(" ", key);
    if (l !is null) l.preorderWalk;
    if (r !is null) r.preorderWalk;
  }
}

class RootNode(T)
{
  Node!T n;

  void insert(T val)
  {
    if (n is null) n = new Node!T(val);
    else n.insert(val);
  }

  void inorderWalk()
  {
    if (n !is null) n.inorderWalk;
    writeln;
  }

  void preorderWalk()
  {
    if (n !is null) n.preorderWalk;
    writeln;
  }
}
