// Example of For and For-in loop
void main() {
  for (int i = 0; i < 3; i++) {
    print("i: $i");
  }

  List names = ["Alice", "Bob"];
  for (var name in names) {
    print(name);
  }
}
