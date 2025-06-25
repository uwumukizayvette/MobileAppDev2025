void main() {
  // Dart means that values can't be null unless you explicitly allow them to be null. 
  String name = "Cynthia";    // name cannot be null
  print(name.length);         // Works fine

  String? nullableName;       // nullableName can be null
  print(nullableName?.length); // Using ?. to safely access length; returns null if nullableName is null
}
