void repeat(int times, Function action) {
  for (int i = 0; i < times; i++) {
    action(); // Call the function
  }
}

void sayHello() {
  print("Hello!");
}

void main() {
  repeat(3, sayHello); // Prints Hello! 3 times
}
