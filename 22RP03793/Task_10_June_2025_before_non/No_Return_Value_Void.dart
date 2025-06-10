// This is a void function that takes a String parameter and prints it
void printMessage(String msg) {
  print(msg); // Just prints, no return
}

void main() {
  // Example usage:
  printMessage("Hello, Dart!"); // Output: Hello, Dart!

  // You can use variables too:
  String greeting = "Welcome to Flutter";
  printMessage(greeting); // Output: Welcome to Flutter

  // It works with string interpolation:
  int year = 2023;
  printMessage("Current year is $year"); // Output: Current year is 2023
}
