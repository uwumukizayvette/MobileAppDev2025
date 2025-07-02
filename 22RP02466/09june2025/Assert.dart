
void main() {
  //
  //An assert statement is used to test assumptions in your code while you're developing it.

  //If the condition is false, the program throws an AssertionError and stops execution (only in debug mode).
  int age = 16;

  // Check that age is 18 or above
  assert(age >= 18, 'Age must be at least 18');

  print('User is eligible to vote.');
}

