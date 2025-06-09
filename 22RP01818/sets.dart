void main() {
  Set<int> numbers = {1, 2, 3};
  numbers.add(2); // Duplicate, will not be added
  numbers.add(4);
  print(numbers);
}
