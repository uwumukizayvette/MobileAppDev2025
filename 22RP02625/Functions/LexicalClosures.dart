// Lexical closure example
Function makeAdder(int addBy) {
  return (int i) => addBy + i; // Captures addBy from outer scope
}

void main() {
  var add2 = makeAdder(2); // Creates a function that adds 2
  print(add2(3)); // 5 (3 + 2)
}