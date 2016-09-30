import std.algorithm, std.conv, std.range, std.stdio, std.string;

void main()
{
  auto n = readln.chomp.to!size_t;

  auto nodes = new BiNode[](n);
  foreach (_; n.iota) {
    auto rd = readln.split.to!(int[]), id = rd[0], l = rd[1], r = rd[2];
    nodes[id] = new BiNode(id, l, r);
  }

  foreach (node; nodes) {
    if (node.l != -1) nodes[node.l].parent = node.id;
    if (node.r != -1) nodes[node.r].parent = node.id;
  }

  foreach (node; nodes)
    writefln("node %d: parent = %d, sibling = %d, degree = %d, depth = %d, height = %d, %s",
             node.id, node.parent, node.sibling(nodes), node.degree,
             node.depth(nodes), node.height(nodes), node.type);
}

class BiNode
{
  int id;
  int parent;
  int l, r;

  this(int id, int l, int r)
  {
    this.id = id;
    this.parent = -1;
    this.l = l;
    this.r = r;
  }

  int sibling(BiNode[] nodes)
  {
    if (parent == -1) return -1;
    auto pn = nodes[parent];
    return pn.l == id ? pn.r : pn.l;
  }

  int degree()
  {
    return (l != -1 ? 1 : 0) + (r != -1 ? 1 : 0);
  }

  int depth(BiNode[] nodes)
  {
    if (parent == -1) return 0;
    else return nodes[parent].depth(nodes) + 1;
  }

  int height(BiNode[] nodes)
  {
    auto lh = l != -1 ? nodes[l].height(nodes) + 1 : 0;
    auto rh = r != -1 ? nodes[r].height(nodes) + 1 : 0;
    return max(lh, rh);
  }

  string type()
  {
    if (parent == -1) return "root";
    else if (degree != 0) return "internal node";
    else return "leaf";
  }
}
