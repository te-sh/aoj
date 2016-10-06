import std.algorithm, std.conv, std.range, std.stdio, std.string;

version(unittest) {} else
void main()
{
  auto n = readln.chomp.to!size_t;
  auto nodes = new BiNode[](n);

  auto prN = readln.split.to!(int[]); prN[] -= 1;
  auto inN = readln.split.to!(int[]); inN[] -= 1;

  auto root = createNodes(nodes, prN, inN);
  auto poN = postorderWalk(nodes, nodes[root]); poN[] += 1;

  writeln(poN.to!(string[]).join(" "));
}

int createNodes(ref BiNode[] nodes, ref int[] prN, ref int[] inN)
{
  if (inN.empty) return -1;

  auto cr = prN.front;
  prN.popFront;

  auto sp = inN.findSplit([cr]);
  auto l = createNodes(nodes, prN, sp[0]);
  auto r = createNodes(nodes, prN, sp[2]);

  nodes[cr] = new BiNode(cr, l, r);
  return cr;
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
