void main() {
  //An operator is a symbol or keyword used in programming to perform operations on variables and values.
  // variable declaration
  int a = 10;
  int b = 3;
  double c = 2.5;
  bool isRaining = false;
  bool isSunny = true;
  dynamic value = 'Hello Dart';

  // === 1. ARITHMETIC OPERATORS ===
  print('--- Arithmetic Operators ---');
  print('a + b = ${a + b}'); // 13
  print('a - b = ${a - b}'); // 7
  print('a * b = ${a * b}'); // 30
  print('a / b = ${a / b}'); // 3.333...
  print('a % b = ${a % b}'); // 1

  // === 2. ASSIGNMENT OPERATORS ===
  print('\n--- Assignment Operators ---');
  int x = 5;
  x += 2; // x = x + 2
  print('x += 2 -> $x'); // 7
  x *= 3; // x = x * 3
  print('x *= 3 -> $x'); // 21
  x ~/= 2; // Integer division
  print('x ~/= 2 -> $x'); // 10

  // === 3. COMPARISON OPERATORS ===
  print('\n--- Comparison Operators ---');
  print('a == b: ${a == b}');   // false
  print('a != b: ${a != b}');   // true
  print('a > b: ${a > b}');     // true
  print('a < b: ${a < b}');     // false
  print('a >= 10: ${a >= 10}'); // true
  print('b <= 3: ${b <= 3}');   // true

  // === 4. LOGICAL OPERATORS ===
  print('\n--- Logical Operators ---');
  print('isSunny && !isRaining: ${isSunny && !isRaining}'); // true
  print('isRaining || isSunny: ${isRaining || isSunny}');   // true
  print('!isRaining: ${!isRaining}');                       // true

  // === 5. BITWISE OPERATORS ===
  print('\n--- Bitwise Operators ---');
  print('a & b = ${a & b}'); // Bitwise AND
  print('a | b = ${a | b}'); // Bitwise OR
  print('a ^ b = ${a ^ b}'); // Bitwise XOR
  print('~a = ${~a}');       // Bitwise NOT
  print('a << 1 = ${a << 1}'); // Left shift
  print('a >> 1 = ${a >> 1}'); // Right shift

  // === 6. TYPE TEST OPERATORS ===
  print('\n--- Type Test Operators ---');
  print('value is String: ${value is String}');  // true
  print('value is! int: ${value is! int}');      // true
  String greeting = value as String;
  print('Greeting in uppercase: ${greeting.toUpperCase()}'); // HELLO DART
}
