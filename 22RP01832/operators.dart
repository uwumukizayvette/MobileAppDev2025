void main() {
  // Arithmetic Operators
  int a = 10;
  int b = 3;

  print('Arithmetic Operators:');
  print('a + b = ${a + b}');    // Addition: 13
  print('a - b = ${a - b}');    // Subtraction: 7
  print('a * b = ${a * b}');    // Multiplication: 30
  print('a / b = ${a / b}');    // Division: 3.3333 (double)
  print('a ~/ b = ${a ~/ b}');  // Integer Division: 3
  print('a % b = ${a % b}');    // Modulus: 1

  // Assignment Operators
  int c = 5;
  print('\nAssignment Operators:');
  print('Initial c = $c');
  c += 3; // c = c + 3
  print('After c += 3: $c');
  c -= 2; // c = c - 2
  print('After c -= 2: $c');
  c *= 4; // c = c * 4
  print('After c *= 4: $c');
  c ~/= 3; // c = c ~/ 3 (integer division)
  print('After c ~/= 3: $c');
  c %= 3; // c = c % 3
  print('After c %= 3: $c');

  // Comparison Operators
  print('\nComparison Operators:');
  print('a == b? ${a == b}');  // false
  print('a != b? ${a != b}');  // true
  print('a > b? ${a > b}');    // true
  print('a < b? ${a < b}');    // false
  print('a >= b? ${a >= b}');  // true
  print('a <= b? ${a <= b}');  // false

  // Logical Operators
  bool x = true;
  bool y = false;
  print('\nLogical Operators:');
  print('x && y = ${x && y}'); // false
  print('x || y = ${x || y}'); // true
  print('!x = ${!x}');         // false

  // Type Test Operators
  dynamic val = "Dart";
  print('\nType Test Operators:');
  if (val is String) {
    print('val is a String with length ${val.length}');
  }
  if (val is! int) {
    print('val is NOT an int');
  }
  var casted = val as String;
  print('Casted val to uppercase: ${casted.toUpperCase()}');

  // Bitwise Operators
  int p = 5;  // binary 0101
  int q = 3;  // binary 0011
  print('\nBitwise Operators:');
  print('p & q = ${p & q}');   // 1 (0001)
  print('p | q = ${p | q}');   // 7 (0111)
  print('p ^ q = ${p ^ q}');   // 6 (0110)
  print('~p = ${~p}');         // bitwise NOT
  print('p << 1 = ${p << 1}'); // left shift: 10 (1010)
  print('p >> 1 = ${p >> 1}'); // right shift: 2 (0010)

  // Conditional (Ternary) Operator
  int age = 20;
  String canVote = age >= 18 ? 'Yes' : 'No';
  print('\nTernary Operator:');
  print('Can vote? $canVote');

  // Null-aware Operators
  String? name;
  print('\nNull-aware Operators:');
  print('Name: ${name ?? 'Guest'}'); // prints Guest because name is null

  name ??= 'Alice';  // assign only if null
  print('Name after ??= operator: $name');

  // Accessing property safely with ?.
  int? length = name?.length;
  print('Length of name: $length');

  // Null assertion operator (dangerous if null!)
  // print(name!.toUpperCase()); // Uncomment if sure name is NOT null

}
