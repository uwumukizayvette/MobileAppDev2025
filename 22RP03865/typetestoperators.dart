void main() {
  dynamic value = 'Hello';
  
  if (value is String) {
    print('value is a String');
  }

  if (value is! int) {
    print('value is not an int');
  }

  var number = 100;
  print((number as int) + 1); // Casting
}
