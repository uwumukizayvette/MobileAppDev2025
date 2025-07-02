void main() {
  // 1️⃣ Lists (Arrays)
  print('--- Lists ---');
  List<String> fruits = ['Apple', 'Banana', 'Mango'];
  fruits.add('Orange');
  print(fruits);         // ['Apple', 'Banana', 'Mango', 'Orange']
  print(fruits[1]);      // Banana
  print(fruits.length);  // 4

  // 2️⃣ Maps (Dictionaries)
  print('\n--- Maps ---');
  Map<String, int> ages = {
    'Alice': 25,
    'Bob': 30,
    'Charlie': 28
  };
  ages['David'] = 22;
  print(ages);            // {'Alice': 25, 'Bob': 30, 'Charlie': 28, 'David': 22}
  print(ages['Alice']);   // 25
  print(ages.keys);       // (Alice, Bob, Charlie, David)

  // 3️⃣ Sets (Unique Collections)
  print('\n--- Sets ---');
  Set<int> numbers = {1, 2, 3, 3}; // Duplicate 3 will be ignored
  numbers.add(4);
  print(numbers);          // {1, 2, 3, 4}
  print(numbers.contains(2)); // true

  // 4️⃣ Enums
  print('\n--- Enums ---');
  Color favoriteColor = Color.green;
  print(favoriteColor);     // Color.green
  print(Color.values);      // [Color.red, Color.green, Color.blue]

  // 5️⃣ Constants
  print('\n--- Constants ---');
  const double pi = 3.14159;
  print(pi);                // 3.14159

  // 6️⃣ final
  print('\n--- final ---');
  final String name = 'Cynthia';
  print(name);              // Cynthia

  // 7️⃣ var (type inferred)
  print('\n--- var ---');
  var city = 'Kigali';
  print(city);              // Kigali
  city = 'Musanze';
  print(city);              // Musanze

  // 8️⃣ dynamic (type can change)
  print('\n--- dynamic ---');
  dynamic something = 100;
  print(something);         // 100
  something = 'Now a string';
  print(something);         // Now a string
}

// Enum definition (outside main function)
enum Color { red, green, blue }
