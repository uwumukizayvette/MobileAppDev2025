void main() {
  int marks = 76;
  String grade;

  // === IF / ELSE IF / ELSE ===
  if (marks >= 90) {
    grade = 'A';
  } else if (marks >= 75) {
    grade = 'B';
  } else if (marks >= 60) {
    grade = 'C';
  } else {
    grade = 'F';
  }

  print('Marks: $marks, Grade: $grade');

  // === SWITCH CASE ===
  switch (grade) {
    case 'A':
      print('Excellent!');
      break;
    case 'B':
      print('Very Good!');
      break;
    case 'C':
      print('Good.');
      break;
    case 'F':
      print('Try harder next time.');
      break;
    default:
      print('Invalid grade.');
  }

  // === FOR LOOP ===
  print('\n--- For Loop ---');
  for (int i = 1; i <= 3; i++) {
    print('Step $i');
  }

  // === WHILE LOOP ===
  print('\n--- While Loop ---');
  int count = 0;
  while (count < 3) {
    print('While count: $count');
    count++;
  }

  // === DO-WHILE LOOP ===
  print('\n--- Do-While Loop ---');
  int doCount = 0;
  do {
    print('Do-While count: $doCount');
    doCount++;
  } while (doCount < 3);

  // === BREAK and CONTINUE ===
  print('\n--- Break & Continue ---');
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      print('Skipping 3');
      continue;
    }
    if (i == 5) {
      print('Breaking at 5');
      break;
    }
    print('Number: $i');
  }
}
