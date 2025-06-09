void main() {
  // 🔹 Core Data Structures & Types

  // Lists
  var fruits = ['Apple', 'Banana', 'Mango'];
  print(fruits[0]); // Output: Apple

  // Maps
  var user = {'name': 'Diane', 'age': 20};
  print(user['name']); // Output: Diane

  // Sets
  var numbers = {1, 2, 3, 1}; 
  print(numbers); // Output: {1, 2, 3}

  // Enums
  print(Status.success); // Output: Status.success

  // Constants
  const pi = 3.14;
  print('pi = $pi');

  // final, dynamic, var
  final nameFinal = 'John'; // Set once
  dynamic x = 10; x = 'text'; // Can change type
  var age = 25;
  print('final: $nameFinal, dynamic: $x, var: $age');

  // 🔹 Dart Language Features

  // Null Safety
  String? name;
  name = 'Sam';
  print(name?.toUpperCase()); // Safe access

  // Late variables
  late String description;
  description = 'Flutter is awesome!';
  print(description);

  // 🔹 Control Flow

  // If-Else
  int score = 80;
  if (score >= 50) {
    print('Pass');
  } else {
    print('Fail');
  }

  // Ternary Operator
  var result = (score >= 50) ? 'Pass' : 'Fail';
  print(result);

  // Switch Statements
  var grade = 'A';
  switch (grade) {
    case 'A':
      print('Excellent');
      break;
    case 'B':
      print('Good');
      break;
    default:
      print('Try harder');
  }

  // Nested Switch
  String level = 'High';
  switch (level) {
    case 'High':
      switch ('Math') {
        case 'Math':
          print('Advanced Math');
          break;
      }
      break;
  }

  // Assert Statements
  int assertAge = 18;
  assert(assertAge >= 18, 'Age must be at least 18');

  // 🔹 Loops & Flow Control

  // For Loop
  for (int i = 0; i < 3; i++) {
    print(i);
  }

  // For-in Loop
  for (var item in ['A', 'B', 'C']) {
    print(item);
  }

  // While Loop
  int i = 0;
  while (i < 3) {
    print(i);
    i++;
  }

  // Nested Loops
  for (int i = 1; i <= 2; i++) {
    for (int j = 1; j <= 2; j++) {
      print('i=$i, j=$j');
    }
  }

  // Break Statement
  for (int i = 0; i < 5; i++) {
    if (i == 3) break;
    print(i);
  }

  // Continue Statement
  for (int i = 0; i < 5; i++) {
    if (i == 2) continue;
    print(i);
  }
}

// Enums (defined outside main)
enum Status { loading, success, error }
