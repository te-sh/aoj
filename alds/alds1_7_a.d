import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;
  auto nodes = new Node[](n);

  foreach (_; n.iota) {
    auto rd = readln.chomp.splitter;
    auto id = rd.front.to!int; rd.popFront;
    auto k = rd.front.to!size_t; rd.popFront;
    auto children = new int[](k);
    foreach (j; k.iota) {
      children[j] = rd.front.to!int;
      rd.popFront;
    }
    nodes[id] = new Node(id, children);
  }

  foreach (node; nodes)
    foreach (child; node.children)
      nodes[child].parent = node.id;

  foreach (node; nodes)
    writefln("node %d: parent = %d, depth = %d, %s, %s",
             node.id, node.parent, node.depth(nodes),
             node.type, node.children);
}

class Node
{
  int id;
  int parent;
  int[] children;

  this(int id, int[] children)
  {
    this.id = id;
    this.parent = -1;
    this.children = children;
  }

  size_t depth(Node[] nodes)
  {
    if (parent == -1) return 0;
    else return nodes[parent].depth(nodes) + 1;
  }

  string type()
  {
    if (parent == -1) return "root";
    else if (!children.empty) return "internal node";
    else return "leaf";
  }
}
