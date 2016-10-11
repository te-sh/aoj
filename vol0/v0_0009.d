import std.algorithm, std.conv, std.range, std.stdio, std.string;
import std.math;

version(unittest) {} else
void main()
{
  auto pi = primes(999_999);

  string line;
  while ((line = readln) !is null) {
    auto n = line.chomp.to!int;
    writeln(pi.assumeSorted.lowerBound(n + 1).length);
  }
}

int[] primes(int n)
{
  auto sieve = new bool[]((n + 1) / 2);
  sieve[] = true;

  foreach (p; iota(1, (n.to!real.sqrt.to!int - 1) / 2 + 1))
    if (sieve[p])
      foreach (q; iota(p * 3 + 1, (n + 1) / 2, p * 2 + 1))
        sieve[q] = false;

  auto r = sieve.enumerate
    .filter!("a[1]")
    .map!("a[0]").map!("a * 2 + 1")
    .map!(to!int).array;
  r[0] = 2;

  return r;
}
