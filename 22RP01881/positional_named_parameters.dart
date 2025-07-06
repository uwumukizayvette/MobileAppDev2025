// Positional parameters: order matters
void showInfo(String name, int age) {
  print('$name is $age years old.');
}

// Named parameters: order doesn’t matter, and they are clearer
void displayInfo({required String name, required String city}) {
  print('$name lives in $city.');
}

void main() {
  showInfo('Alice', 25);
  displayInfo(name: 'Bob', city: 'Kigali');
}
