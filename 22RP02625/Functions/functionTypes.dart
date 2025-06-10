// Built-in function example
void main() {
  // Built-in function
  print('Hello, Dart!'.toLowerCase());

  // User-defined function
  greet('Alice');

  // Anonymous function
  List<int> numbers = [1, 2, 3];
  numbers.forEach((num) {
    print('Anonymous function value: $num');
  });

  // Recursive function
  int result = factorial(5);
  print('Factorial of 5: $result');
}

// User-defined function
void greet(String name) {
  print('Hello, $name!');
}

// Recursive function
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}