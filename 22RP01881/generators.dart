// Generator functions return a sequence using 'sync*' and 'yield'

Iterable<int> countTo(int max) sync* {
  for (int i = 1; i <= max; i++) {
    yield i; // yield each value one by one
  }
}

void main() {
  for (var num in countTo(5)) {
    print(num);
  }
}

