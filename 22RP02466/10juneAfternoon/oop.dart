// ===========================================================
// Dart OOP and Advanced Concepts - Complete Demo
// ===========================================================

import 'dart:isolate';
import 'dart:async';

// ===========================================================
// 1. Introduction to OOP in Dart (Pillars covered throughout the examples)
// ===========================================================

// ===========================================================
// 2. Classes and Objects
class Car {
  String brand;

  Car(this.brand);
}

// ===========================================================
// 3. Instance Variables and Methods
class Calculator {
  int a, b;

  Calculator(this.a, this.b);

  int add() => a + b;
}

// ===========================================================
// 4. Constructors
class User {
  String name;
  int age;

  User(this.name, this.age);
  User.named({required this.name, required this.age});
  factory User.guest() => User("Guest", 0);
}

// ===========================================================
// 5. Class Modifiers (final, const, static, late)
class Config {
  static const appName = "MyApp"; // static
  final String version;

  late String apiUrl;

  Config(this.version);
}

// ===========================================================
// 6. Encapsulation
class BankAccount {
  double _balance;

  BankAccount(this._balance);

  double get balance => _balance;

  void deposit(double amount) {
    _balance += amount;
  }
}

// ===========================================================
// 7. Inheritance
class Animal {
  void makeSound() {
    print("Some sound");
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print("Woof");
  }
}

// ===========================================================
// 8. Abstract Classes and Interfaces
abstract class AnimalInterface {
  void makeSound();
}

class Cat implements AnimalInterface {
  void makeSound() {
    print("Meow");
  }
}

// ===========================================================
// 9. Polymorphism
void makeAnimalSound(Animal animal) {
  animal.makeSound();
}

// ===========================================================
// 10. Mixins
mixin Swimmer {
  void swim() {
    print("Swimming");
  }
}

class Fish with Swimmer {}

// ===========================================================
// 11. Singleton Pattern
class AppController {
  static final AppController _instance = AppController._internal();
  factory AppController() => _instance;

  AppController._internal();
}

// ===========================================================
// 12. Operator Overloading
class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector other) {
    return Vector(x + other.x, y + other.y);
  }
}

// ===========================================================
// 13. Dart Libraries and Private Fields
class MathHelper {
  int _add(int a, int b) => a + b;

  int sum(int a, int b) => _add(a, b);
}

// ===========================================================
// 14. Dart Generics
class Box<T> {
  T value;

  Box(this.value);
}

// ===========================================================
// 15. Creating Records (Dart 3+)
var person = ("John", 30);

// ===========================================================
// 16. Exception Handling
void exceptionExample() {
  try {
    int result = 10 ~/ 0;
    print(result);
  } catch (e) {
    print("Error: $e");
  } finally {
    print("Done");
  }
}

// ===========================================================
// 17. Iterables and Lists
void iterateList() {
  List<String> names = ["Alice", "Bob"];
  for (var name in names) {
    print(name);
  }
}

// ===========================================================
// 18. Dart Synchronous Workflows
void syncLoop() {
  for (var i = 1; i <= 3; i++) {
    print(i);
  }
}

// ===========================================================
// 19. Futures and async/await
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return "Data received.";
}

// ===========================================================
// 20. Futures In-depth
void futureExample() {
  fetchData().then((data) => print(data)).catchError((e) => print("Error: $e"));
}

// ===========================================================
// 21. Streams
Stream<int> numberStream() async* {
  for (var i = 1; i <= 3; i++) {
    yield i;
  }
}

// ===========================================================
// 22. Streams In-depth
void streamExample() {
  final stream = numberStream();
  stream.listen(
    (data) => print(data),
    onError: (e) => print("Error: $e"),
    onDone: () => print("Done"),
  );
}

// ===========================================================
// 23. Dart Isolates Overview
void isolateFunction(SendPort sendPort) {
  sendPort.send("Hello from isolate");
}

// ===========================================================
// 24. Event Loop, Event Queue, and Microtask Queue
void eventLoopExample() {
  print("Start");
  Future.microtask(() => print("Microtask"));
  Future(() => print("Future"));
  print("End");
}

// ===========================================================
// 25. Isolate Structure and Memory
void isolateMemoryExample() {
  ReceivePort receivePort = ReceivePort();
  Isolate.spawn(isolateFunction, receivePort.sendPort);
  receivePort.listen((message) {
    print("Isolate says: $message");
  });
}

// ===========================================================
// 26. Parallelism and Isolate Groups
void longTask(int number) {
  print("Processing $number");
}

// ===========================================================
// MAIN FUNCTION TO DEMONSTRATE ALL
void main() {
  // 2. Classes and Objects
  var car = Car("Toyota");
  print(car.brand);

  // 3. Methods
  var calculator = Calculator(5, 10);
  print("Sum: ${calculator.add()}");

  // 4. Constructors
  var user = User.named(name: "Alice", age: 25);
  var guest = User.guest();
  print("${user.name}, ${guest.name}");

  // 5. Class Modifiers
  var config = Config("1.0.0")..apiUrl = "https://api.example.com";
  print("${Config.appName} v${config.version} -> ${config.apiUrl}");

  // 6. Encapsulation
  var account = BankAccount(1000);
  account.deposit(500);
  print("Balance: ${account.balance}");

  // 7. Inheritance
  var dog = Dog();
  dog.makeSound();

  // 8. Abstract and Interfaces
  var cat = Cat();
  cat.makeSound();

  // 9. Polymorphism
  makeAnimalSound(dog);
  makeAnimalSound(cat);

  // 10. Mixins
  var fish = Fish();
  fish.swim();

  // 11. Singleton Pattern
  var controller1 = AppController();
  var controller2 = AppController();
  print(controller1 == controller2 ? "Same instance" : "Different instances");

  // 12. Operator Overloading
  var v1 = Vector(1, 2);
  var v2 = Vector(3, 4);
  var v3 = v1 + v2;
  print("Resulting Vector: (${v3.x}, ${v3.y})");

  // 13. Dart Libraries and Private Fields
  var mathHelper = MathHelper();
  print("Sum: ${mathHelper.sum(2, 3)}");

  // 14. Generics
  var intBox = Box<int>(123);
  var strBox = Box<String>("Hello");
  print("${intBox.value}, ${strBox.value}");

  // 15. Records
  print("Person Name: ${person.$1}, Age: ${person.$2}");

  // 16. Exception Handling
  exceptionExample();

  // 17. Iterables and Lists
  iterateList();

  // 18. Synchronous Workflow
  syncLoop();

  // 19. Futures
  fetchData().then(print);

  // 20. Futures In-depth
  futureExample();

  // 21. Streams
  streamExample();

  // 24. Event Loop
  eventLoopExample();

  // 25. Isolate
  isolateMemoryExample();

  // 26. Parallelism (spawning isolates for long-running tasks)
  for (var i = 0; i < 4; i++) {
    Isolate.spawn(longTask, i);
  }
}
