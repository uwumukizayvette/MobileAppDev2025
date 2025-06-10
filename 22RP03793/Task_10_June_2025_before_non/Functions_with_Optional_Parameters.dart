// The second parameter is optional
void greet(String name, [String? title]) {
  if (title != null) {
    print("Hello $title $name");
  } else {
    print("Hello $name");
  }
}

void main() {
  greet("Janvier"); // No title
  greet("Janvier", "Mr"); // With title
}
