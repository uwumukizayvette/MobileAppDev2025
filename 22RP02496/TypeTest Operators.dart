//Type Test Operators
//is
void main() {
  int num = 42;
  print(num is int); // true
  print(num is! int); // false
  print(num is String); // false
}
