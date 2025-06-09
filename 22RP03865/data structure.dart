//arrays
void main() {
  List<String> fruits = ['Apple', 'Banana', 'Mango'];
  print(fruits[0]); // Apple
}
//Maps
void main() {
  Map<String, int> scores = {'Math': 90, 'Science': 85};
  print(scores['Math']); // 90
}
//sets
void main() {
  Set<int> numbers = {1, 2, 3, 3}; // duplicate removed
  print(numbers); // {1, 2, 3}
}

//enums
enum Day { Monday, Tuesday, Wednesday }

void main() {
  Day today = Day.Tuesday;
  print(today); // Day.Tuesday
}

//const and final
void main() {
  const pi = 3.14; // compile-time constant
  final name = 'Phoebe'; // runtime constant
}

//var
void main() {
  var age = 20; // Dart infers int
  age = 21;
}

//dynamic
void main() {
  dynamic something = 10;
  something = 'Hello'; // allowed
}

// Dart Language Features
//1. Null Safety
void main() {
  String? name; // nullable
  name = null; // allowed because of ?
}
//2.Late Variables
late String description;

void main() {
  description = 'This is Dart.';
  print(description);
}

//3.If-Else Statements
void main() {
  int score = 70;
  if (score >= 60) {
    print("Passed");
  } else {
    print("Failed");
  }
}
//4.ternary operator
void main() {
  int age = 18;
  String result = age >= 18 ? "Adult" : "Minor";
  print(result); // Adult
}
//5.switch statements
void main() {
  int day = 1;
  switch (day) {
    case 1:
      print("Monday");
      break;
    case 2:
      print("Tuesday");
      break;
    default:
      print("Other Day");
  }
}
//6.nested switch
void main() {
  int mainMenu = 1;
  int subMenu = 2;

  switch (mainMenu) {
    case 1:
      switch (subMenu) {
        case 2:
          print("Sub Option 2 selected");
          break;
      }
      break;
  }
}
//7.nested switch
void main() {
  int mainMenu = 1;
  int subMenu = 2;

  switch (mainMenu) {
    case 1:
      switch (subMenu) {
        case 2:
          print("Sub Option 2 selected");
          break;
      }
      break;
  }
}
//8.asserts statement
void main() {
  int age = 20;
  assert(age >= 18, "Age must be at least 18");
  print("Valid age");
}
l//loops and flow control
void main() {
  for (int i = 0; i < 3; i++) {
    print(i);
  }
}
//For-In Loop

void main() {
  List fruits = ['Apple', 'Banana'];
  for (var fruit in fruits) {
    print(fruit);
  }
}

//while loop
void main() {
  int i = 0;
  while (i < 3) {
    print(i);
    i++;
  }
}
//nested loop
void main() {
  for (int i = 1; i <= 2; i++) {
    for (int j = 1; j <= 2; j++) {
      print('$i x $j = ${i * j}');
    }
  }
}
//break continue
void main() {
  for (int i = 0; i < 5; i++) {
    if (i == 3) break;
    print(i);
  }
}
//Continue Statement
void main() {
  for (int i = 0; i < 5; i++) {
    if (i == 2) continue;
    print(i);
  }
}






