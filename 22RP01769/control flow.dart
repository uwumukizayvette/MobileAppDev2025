void main() {
    //Used to run code based on conditions
  int age = 18;

  if (age >= 18) {
    print('Adult');
  } else if (age > 13) {
    print('Teenager');
  } else {
    print('Child');
  }

               //switch and case
//Used for multiple conditions on a single variable.
   var grade = 'B';

  switch (grade) {
    case 'A':
      print('Excellent');
      break;
    case 'B':
      print('Good');
      break;
    case 'C':
      print('Fair');
      break;
    default:
      print('Invalid grade');
  }

                  ///for loop
 //Used when you know how many times to repeat.

   for (int i = 1; i <= 5; i++) {
    print('Hello $i');
  }

               ///while loop
//Repeats as long as the condition is true.

    int i = 0;

  while (i < 3) {
    print('i = $i');
    i++;
  }

              ///do...while loop
///Executes the block at least once, then checks the condition.

  int i = 0;

  do {
    print('i = $i');
    i++;
  } while (i < 3);

                 //break and continue
//break: exits the loop immediately.
//continue: skips the current iteration and goes to the next one.

 for (int i = 1; i <= 5; i++) {
    if (i == 3) continue;
    if (i == 9) break;
    print(i);
  }
  // Output: 1, 2, 4
}