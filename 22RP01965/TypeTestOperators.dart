void main() {
  var item = 'Hello';

  // ignore: unnecessary_type_check
  print(item is String); // true
  print(item is! int);   // true

  var name = item;
  print('Length: ${name.length}');
}
