Function makeAdder(int addBy) {
  return (int i) => i + addBy; // Closure captures `addBy`
}

void main() {
  var add2 = makeAdder(2);
  print(add2(3)); // Output: 5
}
