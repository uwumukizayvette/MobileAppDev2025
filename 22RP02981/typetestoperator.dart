void main() {
  dynamic value1 = 'Claudine';
  dynamic value2 = 25;
  dynamic value3 = 3.14;

  // Using 'is'
  print('value1 is String: ${value1 is String}'); // true
  print('value2 is int: ${value2 is int}');       // true
  print('value3 is double: ${value3 is double}'); // true

  // Using 'is!'
  print('value1 is! int: ${value1 is! int}');     // true
  print('value2 is! String: ${value2 is! String}'); // true
  print('value3 is! bool: ${value3 is! bool}');   // true
}
