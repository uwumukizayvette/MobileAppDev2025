//🔹 1. If-Else Statements
//Used to execute code based on a condition.
void main() {
  int age = 18;

  if (age >= 18) {
    print('You are an adult.');
  } else {
    print('You are a minor.');
  }

//You can also chain with else if:
 int score=80 ;
if (score >= 90) {
  print('A');
} else if (score >= 80) {
  print('B');
} else {
  print('C or lower');
}


//2. Ternary Operator
  String status = (age >= 18) ? 'Adult' : 'Minor';
  print('Status: $status');

  //3. Switch Statements
 String grade = 'B';

  switch (grade) {
    case 'A':
      print('Excellent!');
      break;
    case 'B':
      print('Good job!');
      break;
    case 'C':
      print('Needs improvement.');
      break;
    default:
      print('Invalid grade');
  }
}