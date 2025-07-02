void greet(String name, [String? title]) {
  if (title != null) {
    print('Hello, $title $name!');
  } else {
    print('Hello, $name!');
  }
}

void main() {
  greet('Alice');             // Output: Hello, Alice!
  greet('Bob', 'Dr.');        // Output: Hello, Dr. Bob!
}
