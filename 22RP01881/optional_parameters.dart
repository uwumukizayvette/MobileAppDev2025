// Optional positional parameters use []
void greet([String name = 'Guest']) {
  print('Hello, $name');
}

// Optional named parameters use {} and can have default values
void register({String? course, int level = 1}) {
  print('Course: $course, Level: $level');
}

void main() {
  greet(); // uses default
  greet('Marie');

  register(course: 'Dart');
}
