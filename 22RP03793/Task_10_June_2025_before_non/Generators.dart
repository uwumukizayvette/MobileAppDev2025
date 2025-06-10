// sync* for synchronous generator
Iterable<int> countTo(int n) sync* {
  for (int i = 1; i <= n; i++) {
    yield i;
  }
}

void main() {
  for (var number in countTo(5)) {
    print(number); // Prints 1 to 5
  }
}
