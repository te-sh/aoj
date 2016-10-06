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
    case "find":
      rd.popFront;
      writeln(root.find(rd.front.to!int) ? "yes" : "no");
      break;
    case "delete":
      rd.popFront;
      root.remove(rd.front.to!int);
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

interface INode(T)
{
  void insert(T val);
  bool find(T val);
  void remove(T val);
  void removeChild(Node!T node);
  void replaceChild(Node!T node1, Node!T node2);
}

class Node(T) : INode!T
{
  T key;
  INode!T parent;
  Node!T l, r;

  this(T key, INode!T parent)
  {
    this.key = key;
    this.parent = parent;
  }

  void insert(T val)
  {
    if (val < key) {
      if (l is null) l = new Node!T(val, this);
      else l.insert(val);
    } else {
      if (r is null) r = new Node!T(val, this);
      else r.insert(val);
    }
  }

  bool find(T val)
  {
    if (key == val) {
      return true;
    } else if (val < key) {
      if (l is null) return false;
      else return l.find(val);
    } else {
      if (r is null) return false;
      else return r.find(val);
    }
  }

  void remove(T val)
  {
    if (key == val) {
      removeThis;
    } else if (val < key) {
      if (l !is null) l.remove(val);
    } else {
      if (r !is null) r.remove(val);
    }
  }

  void removeThis()
  {
    if (l is null && r is null) {
      parent.removeChild(this);
    } else if (l is null) {
      parent.replaceChild(this, r);
      r.parent = parent;
    } else if (r is null) {
      parent.replaceChild(this, l);
      l.parent = parent;
    } else {
      auto m = r.findMin;
      key = m.key;
      m.removeThis();
    }
  }

  Node!T findMin()
  {
    if (l is null) return this;
    else return l.findMin;
  }

  void removeChild(Node!T child)
  {
    if (l == child) l = null;
    else if (r == child) r = null;
  }

  void replaceChild(Node!T child1, Node!T child2)
  {
    if (l == child1) l = child2;
    else if (r == child1) r = child2;
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

class RootNode(T) : INode!T
{
  Node!T n;

  void insert(T val)
  {
    if (n is null) n = new Node!T(val, this);
    else n.insert(val);
  }

  bool find(T val)
  {
    if (n is null) return false;
    else return n.find(val);
  }

  void remove(T val)
  {
    if (n !is null) n.remove(val);
  }

  void removeChild(Node!T child)
  {
    if (n == child) n = null;
  }

  void replaceChild(Node!T child1, Node!T child2)
  {
    if (n == child1) n = child2;
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
