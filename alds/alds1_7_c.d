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

  auto root = nodes.find!(node => node.isRoot).front;

  writeln("Preorder");
  writeln(" ", preorderWalk(nodes, root).to!(string[]).join(" "));
  writeln("Inorder");
  writeln(" ", inorderWalk(nodes, root).to!(string[]).join(" "));
  writeln("Postorder");
  writeln(" ", postorderWalk(nodes, root).to!(string[]).join(" "));
}

int[] preorderWalk(BiNode[] nodes, BiNode node)
{
  int[] r;
  r ~= [node.id];
  if (node.l != -1) r ~= preorderWalk(nodes, nodes[node.l]);
  if (node.r != -1) r ~= preorderWalk(nodes, nodes[node.r]);
  return r;
}

int[] inorderWalk(BiNode[] nodes, BiNode node)
{
  int[] r;
  if (node.l != -1) r ~= inorderWalk(nodes, nodes[node.l]);
  r ~= [node.id];
  if (node.r != -1) r ~= inorderWalk(nodes, nodes[node.r]);
  return r;
}

int[] postorderWalk(BiNode[] nodes, BiNode node)
{
  int[] r;
  if (node.l != -1) r ~= postorderWalk(nodes, nodes[node.l]);
  if (node.r != -1) r ~= postorderWalk(nodes, nodes[node.r]);
  r ~= [node.id];
  return r;
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

  bool isRoot()
  {
    return parent == -1;
  }
}
