// Synchronous generator (returns Iterable)
Iterable<int> countUpTo(int n) sync* {
  for (int i = 1; i <= n; i++) {
    yield i; // Yields values one at a time
  }
}

// Asynchronous generator (returns Stream)
Stream<int> countDownFrom(int n) async* {
  for (int i = n; i >= 1; i--) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

void main() {
  // Using sync generator
  print(countUpTo(5).toList()); // [1, 2, 3, 4, 5]
  
  // Using async generator
  countDownFrom(3).listen(print); // Prints 3, 2, 1 with 1-second delays
}