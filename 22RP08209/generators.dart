//Generators are functions that return values one at a time using the yield keyword, instead of returning all at once like a list.
// They are useful for creating iterators and can be more memory efficient than returning a full list.
// Synchronous generator using yield
Iterable<int> countToThree() sync* {
  yield 1;
  yield 2;
  yield 3;
}

void main() {
  for (var number in countToThree()) {
    print(number); // Prints 1, 2, 3
  }
}
