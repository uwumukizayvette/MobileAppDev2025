void main() {
  // 1. if / else
  int score = 85;
  if (score >= 90) {
    print("🟢 Excellent");
  } else if (score >= 75) {
    print("🟡 Very Good");
  } else {
    print("🔴 Keep trying");
  }

  // 2. switch / case
  String grade = 'B';
  switch (grade) {
    case 'A':
      print("Grade A: Excellent");
      break;
    case 'B':
      print("Grade B: Good");
      break;
    case 'C':
      print("Grade C: Fair");
      break;
    default:
      print("Invalid grade");
  }

  // 3. for loop
  print("➡️ For loop:");
  for (int i = 1; i <= 5; i++) {
    print("Count: $i");
  }

  // 4. while loop
  print("➡️ While loop:");
  int x = 1;
  while (x <= 3) {
    print("x = $x");
    x++;
  }

  // 5. do-while loop
  print("➡️ Do-While loop:");
  int y = 1;
  do {
    print("y = $y");
    y++;
  } while (y <= 3);

  // 6. break
  print("➡️ Break example:");
  for (int i = 1; i <= 10; i++) {
    if (i == 5) break;
    print("i = $i"); // prints 1 to 4
  }

  // 7. continue
  print("➡️ Continue example:");
  for (int i = 1; i <= 5; i++) {
    if (i == 3) continue;
    print("i = $i"); // skips 3
  }

  // 8. return (inside a function)
  int result = square(4);
  print("➡️ Result of square(4): $result");
}

// Function to demonstrate 'return'
int square(int n) {
  return n * n;
}
