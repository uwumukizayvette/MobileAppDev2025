void greetUser(){
  print('Hello , Welcome to dart programming !');
}
int getNumber(){
  return 42; 
}

void main() {
  greetUser();
  
  int number = getNumber();
  print('The number is: $number');
}