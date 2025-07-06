// Function with no return (void)
void noReturn() {
  print('I do not return anything.');
}

// Function with return type
int add(int a, int b) {
  return a + b;
}

// Function as a variable (anonymous)
var multiply = (int x, int y) => x * y;

void main() {
  noReturn();
  print('Sum: ${add(3, 4)}');
  print('Product: ${multiply(3, 5)}');
}
