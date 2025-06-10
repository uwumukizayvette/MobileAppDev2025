//
void greet ([String name = "user"]) {
  print("Hello, $name!");
}
void main() {
  // Calling the greet function with a name
  greet("MANZI");
  
  // Calling the greet function without a name
  greet();
  greet('manzi');
}