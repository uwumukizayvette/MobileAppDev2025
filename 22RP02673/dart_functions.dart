// dart_functions_demo.dart

// 1. Regular Function
// This function prints a greeting to uwera.
void greet() {
  print("Hello, uwera!"); // Prints a fixed greeting message to the console.
}

// 2. Function with Parameters
// This function greets any user by their name.
void greetUser(String name) {
  print("Hello, $name!"); // Uses the parameter 'name' to personalize the greeting.
}

// 3. Arrow Function
// This function returns the square of a number using short syntax.
int square(int x) => x * x; // Arrow syntax for a function that returns x times x.

// 4. Function with Optional Positional Parameters
// This function prints a message, and if a sender is given, it includes the sender.
void showMessage(String message, [String? sender]) {
  // Checks if sender is provided, prints message with or without sender.
  print(sender != null ? "$message from $sender" : message);
}

// 5. Function with Optional Named Parameters
// This function prints details, name and age, both are optional.
void showDetails({String? name, int? age}) {
  // Prints the name and age, even if they are not provided (null).
  print("Name: $name, Age: $age");
}

// 6. Function with Named Parameters (required)
// This function registers a user, username and email are required.
void register({required String username, required String email}) {
  // Prints the username and email, both must be provided.
  print("Registered user: $username, email: $email");
}

// 7. Function with Return Value
// This function adds two numbers and returns the result.
int add(int a, int b) {
  return a + b; // Returns the sum of a and b.
}

// 8. Function with Implicit Return Type
// This function subtracts b from a, Dart figures out the return type.
subtract(a, b) {
  return a - b; // Returns the difference, type is inferred.
}

// 9. Function with No Return Value (Void)
// This function just prints a logout message, doesn't return anything.
void logOut() {
  print("User logged out"); // Only prints a message, no return value.
}

// 10. Higher-Order Function (takes a function as parameter)
// This function takes another function and runs it.
void executeAction(Function action) {
  action(); // Calls the function passed as a parameter.
}

// 11. Lexical Closure (returns a function that captures outer variable)
// This function returns another function that multiplies by a given number.
Function makeMultiplier(int multiplier) {
  // Returns a function that remembers the multiplier value.
  return (int value) => value * multiplier;
}

// 12. Synchronous Generator
// This function generates numbers from 1 to n, one at a time.
Iterable<int> countTo(int n) sync* {
  // Uses yield to return numbers one by one.
  for (int i = 1; i <= n; i++) {
    yield i; // Pauses and returns the next number in the sequence.
  }
}

// 13. Asynchronous Generator
// This function generates numbers from 1 to n with a delay between each.
Stream<int> countToAsync(int n) async* {
  // Uses yield and await to return numbers with a delay.
  for (int i = 1; i <= n; i++) {
    await Future.delayed(Duration(milliseconds: 500)); // Waits 0.5 seconds.
    yield i; // Returns the next number after the delay.
  }
}

// ------------------- HERE ARE MAIN FUNCTION -------------------

void main() {
  // 1. Regular Function
  print("1. Regular Function:"); // Section header for output.
  greet(); // Calls greet(), prints a greeting to uwera.

  // 2. Function with Parameters
  print("\n2. Function with Parameters:"); // Section header.
  greetUser("charlenne"); // Calls greetUser with "charlenne" as the name.

  // 3. Arrow Function
  print("\n3. Arrow Function:"); // Section header.
  print("Square of 3: ${square(3)}"); // Calls square(3), prints the result.

  // 4. Optional Positional Parameters
  print("\n4. Optional Positional Parameters:"); // Section header.
  showMessage("Hello"); // Calls showMessage with only the message.
  showMessage("Hello", "charly"); // Calls showMessage with message and sender.

  // 5. Optional Named Parameters
  print("\n5. Optional Named Parameters:"); // Section header.
  showDetails(name: "charlenne", age: 21); // Calls showDetails with both parameters.

  // 6. Required Named Parameters
  print("\n6. Required Named Parameters:"); // Section header.
  register(username: "charlenne", email: "charlenneuwera@gmail.com"); // Both required.

  // 7. Return Value
  print("\n7. Return Value:"); // Section header.
  print("5 + 5 = ${add(5, 5)}"); // Calls add(5, 5), prints the sum.

  // 8. Implicit Return Type
  print("\n8. Implicit Return Type:"); // Section header.
  print("5 - 2 = ${subtract(5, 2)}"); // Calls subtract(5, 2), prints the difference.

  // 9. Void Function
  print("\n9. Void Function:"); // Section header.
  logOut(); // Calls logOut(), prints logout message.

  // 10. Higher-Order Function
  print("\n10. Higher-Order Function:"); // Section header.
  executeAction(() => print("This is a passed function.")); // Passes a function to executeAction.

  // 11. Lexical Closures
  print("\n11. Lexical Closures:"); // Section header.
  var triple = makeMultiplier(3); // Creates a function that multiplies by 3.
  print("3 x 4 = ${triple(4)}"); // Calls triple(4), prints the result.

  // 12. Synchronous Generator
  print("\n12. Synchronous Generator:"); // Section header.
  for (var number in countTo(3)) { // Loops through numbers 1 to 3.
    print(number); // Prints each number.
  }

  // 13. Asynchronous Generator (with delay)
  print("\n13. Asynchronous Generator (with delay):"); // Section header.
  // Listens to the stream and prints each value as it arrives.
  countToAsync(3).listen((val) => print("Async value: $val"));
}