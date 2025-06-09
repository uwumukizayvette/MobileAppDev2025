void main() {
  int score = 75;

  // if/else
  if (score >= 90) {
    print('Excellent');
  } else if (score >= 70) {
    print('Good');
  } else {
    print('Try again');
  }

  // for loop
  for (int i = 1; i <= 3; i++) {
    print('Count: $i');
  }

  // switch-case
  int day = 2;
  switch (day) {
    case 1:
      print('Monday');
      break;
    case 2:
      print('Tuesday');
      break;
    default:
      print('Other day');
  }
}
