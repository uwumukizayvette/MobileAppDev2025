// 1. Top-level function
void topLevelFunction() {
  print('This is a top-level function');
}

void main() {
  topLevelFunction();

  // 2. Nested function
  void nestedFunction() {
    print('This is a nested function');

    // 3. Anonymous function
    var anonymousFunc = () {
      print('This is an anonymous function');
    };
    anonymousFunc();
  }

  nestedFunction();

  // 4. Arrow function
  var arrowFunc = (String name) => 'Hello, $name!';
  print(arrowFunc('Dart')); // Output: Hello, Dart!

  // Using all types together
  var numbers = [1, 2, 3];
  numbers.forEach((number) {
    // Anonymous function
    var square = (int x) => x * x; // Nested arrow function
    print(square(number));
  });
}
