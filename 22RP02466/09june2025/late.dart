//late modifier allows you to declare a non-nullable variable without initializing it immediately
late String description;

void main() {
  // Initialize later
  description = 'This is a late initialized variable.';
  print(description);
}
//If you access a late variable before initialization, you get a runtime error.