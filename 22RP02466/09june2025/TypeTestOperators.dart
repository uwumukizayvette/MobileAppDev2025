void main() {
  // Dynamic variable that holds a String value
  String data = 'Hello, Dart!';

  // === Using 'is' to check type ===
  if (data is String) {
    print("✅ 'data' is a String.");
  }

  // === Using 'is!' to check if NOT a type ===
  if (data is! int) {
    print("✅ 'data' is NOT an int.");
  }

  // === Using 'as' to cast the type ===
  String message = data as String;
  print("Uppercased message: ${message.toUpperCase()}");
}
