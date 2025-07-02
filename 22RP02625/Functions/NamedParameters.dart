// Named parameters (using {})
void displayPerson({required String name, required int age}) {
  print('Name: $name, Age: $age');
}

void main() {
  displayPerson(age: 25, name: 'Charlie'); // Order doesn't matter
}