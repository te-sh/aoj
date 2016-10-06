import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.container;

version(unittest) {} else
void main()
{
  auto si = readln.split;
  auto st = SList!int();

  int a, b;
  foreach (s; si) {
    switch(s) {
    case "+":
      st.getOperands(a, b);
      st.insert(b + a);
      break;
    case "-":
      st.getOperands(a, b);
      st.insert(b - a);
      break;
    case "*":
      st.getOperands(a, b);
      st.insert(b * a);
      break;
    default:
      st.insert(s.to!int);
    }
  }

  writeln(st.front);
}

void getOperands(ref SList!int st, ref int a, ref int b)
{
  a = st.front; st.removeFront;
  b = st.front; st.removeFront;
}
