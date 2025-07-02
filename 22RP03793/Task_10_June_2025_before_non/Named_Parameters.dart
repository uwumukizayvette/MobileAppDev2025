void createUser({required String name, int age = 18}) {
  print("User: $name, Age: $age");
}

void main() {
  createUser(name: "Alice", age: 25); // Named arguments
  createUser(name: "Bob"); // Age uses default
}
