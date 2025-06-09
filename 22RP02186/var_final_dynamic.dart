void main() {
  var name = 'Alice';        // Can be reassigned
  final city = 'Kigali';     // Cannot be reassigned
  dynamic anything = 42;     // Can hold any type

  name = 'Adele';
  anything = 'Now a string';
  print('$name from $city');
  print('Dynamic value: $anything');
}
