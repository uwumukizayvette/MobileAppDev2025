// Optional positional parameters (using [])
void greet([String name = 'Guest']) {
  print('Hello, $name!');
}

void main() {
  greet(); // Hello, Guest!
  greet('Bob'); // Hello, Bob!
}