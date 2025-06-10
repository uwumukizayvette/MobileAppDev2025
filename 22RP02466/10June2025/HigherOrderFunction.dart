void printTwice(void Function() action) {
  action();
  action();
}

void sayHi() {
  print('Hi!');
}

void main() {
  printTwice(sayHi);
}
