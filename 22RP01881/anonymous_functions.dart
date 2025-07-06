// Anonymous functions (closures or lambdas) don’t have names

void main() {
  // Example: using anonymous function in a loop
  List<String> names = ['Alice', 'Bob', 'Clare'];

  names.forEach((name) {
    print('Hello $name');
  });
}
