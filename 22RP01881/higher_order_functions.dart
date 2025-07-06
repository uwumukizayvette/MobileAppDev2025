// A function that takes another function as a parameter is higher-order

void applyFunction(int x, int y, Function operation) {
  print('Result: ${operation(x, y)}');
}

int add(int a, int b) => a + b;

void main() {
  applyFunction(4, 5, add); // Passing function as argument
}
