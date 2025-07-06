// Dart Functions Tutorial with Examples and Comments

// 1. Regular Function
void greet() {
  print("Hello!"); // Simple function that prints a greeting
}

// 2. Function with Parameters
void greetUser(String name) {
  print("Hello, $name!"); // Takes a name and prints personalized greeting
}

// 3. Arrow Function (shorter syntax)
int square(int x) => x * x; // Returns square of a number using arrow function

// 4. Function with Optional Parameters
void sayHello([String name = "Blaise"]) {
  print("Hello, $name!"); // name is optional, default is "Guest"
}

// 5. Named Parameters
void describeUser({required String name, int age = 18}) {
  print("Name: $name, Age: $age"); // Named parameters with default age
}

// 6. Return Values
String getGreeting(String name) {
  return "Hi, $name!"; // Returns a string
}

// 7. Implicit Return Type
getAge() {
  return 20; // No return type declared, Dart infers it as int
}

// 8. Void (No return value)
void showAppVersion() {
  print("App version 1.0"); // Does not return anything
}

// 9. Higher-Order Function (takes another function as parameter)
void executeTask(Function task) {
  task(); // Calls the function passed as an argument
}

// 10. Lexical Closures
Function counter() {
  int count = 0;
  return () {
    count++;
    print("Count: $count"); // Remembers the value of count across calls
  };
}

// 11. Generator (sync*)
Iterable<int> numberGenerator() sync* {
  for (int i = 1; i <= 3; i++) {
    yield i; // Generates numbers one at a time
  }
}

// MAIN FUNCTION to test the above
void main() {
  greet();
  greetUser("Yvette");
  print("Square of 4 is: ${square(4)}");
  sayHello();
  sayHello("Mukiza");
  describeUser(name: "Tricia");
  print(getGreeting("Yves"));
  print("User age: ${getAge()}");
  showAppVersion();

  // Higher-order function test
  executeTask(() => print("Task executed!"));

  // Lexical closure test
  var myCounter = counter();
  myCounter();
  myCounter();

  // Generator test
  for (var number in numberGenerator()) {
    print("Generated number: $number");
  }
}
