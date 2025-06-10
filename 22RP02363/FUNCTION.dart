// Iyi function ni isanzwe (Regular Function)
void greet() {
  print("Muraho neza!");
}

// Function ifite parameter imwe (izina)
void greetUser(String name) {
  print("Muraho $name!");
}

// Arrow function: ifata umubare igasubiza ikubye
int square(int x) => x * x;

// Optional parameter: imyaka ni optional (ntigomba guhora ihari)
void showInfo(String name, [int? age]) {
  print("Izina: $name");
  if (age != null) {
    print("Imyaka: $age");
  }
}

// Function ifite parameters zanditswe mu mazina (named parameters)
void displayUser({required String name, int age = 18}) {
  print("Izina: $name, Imyaka: $age");
}

// Function isubiza igisubizo (String)
String getWelcomeMessage(String name) {
  return "Murakaza neza $name!";
}

// Implicit return type (Dart imenya ubwoko bw’igisubizo)
getCity() => "Kigali";

// Function nta gisubizo isubiza (Void)
void sayThanks() {
  print("Murakoze cyane!");
}

// Higher-order function: yakira indi function
void processNum(int number, Function func) {
  print("Result: ${func(number)}");
}

// Lexical Closure: ikora function izibukira agaciro ka multiplier
Function multiplier(int factor) {
  return (int value) => factor * value;
}

// Generator function: isubiza urutonde (Iterable) gahoro gahoro
Iterable<int> countTo(int max) sync* {
  for (int i = 1; i <= max; i++) {
    yield i;
  }
}

// Main function yerekana uko functions zikora
void main() {
  // Question 1: Regular Function
  print("This is the output of Question 1:");
  greet();

  // Question 2: Function with Parameters
  print("\nThis is the output of Question 2:");
  greetUser("Sandrine");

  // Question 3: Arrow Function (short function syntax)
  print("\nThis is the output of Question 3:");
  print("Square of 4 is: ${square(4)}");

  // Question 4: Function with Optional Parameters
  print("\nThis is the output of Question 4:");
  showInfo("Alice");
  showInfo("Alice", 22);

  // Question 5: Named Parameters
  print("\nThis is the output of Question 5:");
  displayUser(name: "John");
  displayUser(name: "John", age: 25);

  // Question 6: Return Values
  print("\nThis is the output of Question 6:");
  print(getWelcomeMessage("UWABAZIMANA"));

  // Question 7: Implicit Return Type
  print("\nThis is the output of Question 7:");
  print("City: ${getCity()}");

  // Question 8: No Return Value (Void)
  print("\nThis is the output of Question 8:");
  sayThanks();

  // Question 9: Higher-Order Functions
  print("\nThis is the output of Question 9:");
  processNum(5, square);

  // Question 10: Lexical Closures
  print("\nThis is the output of Question 10:");
  var timesThree = multiplier(3);
  print("3 x 4 = ${timesThree(4)}");

  // Question 11: Generators
  print("\nThis is the output of Question 11:");
  for (int number in countTo(5)) {
    print("Counting: $number");
  }
}
