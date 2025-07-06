// Function returning a value
String getGreeting(String name) {
  return 'Hi $name';
}

// Void return type
void logMessage() {
  print('This is a log.');
}

void main() {
  print(getGreeting('John'));
  logMessage();
}
