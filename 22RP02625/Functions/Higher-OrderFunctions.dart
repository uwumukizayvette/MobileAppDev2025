// Higher-order function
void processList(List<int> list, int Function(int) processor) {
  for (var i = 0; i < list.length; i++) {
    list[i] = processor(list[i]);
  }
}

void main() {
  var numbers = [1, 2, 3];
  processList(numbers, (n) => n * 2); // Passing a function as argument
  print(numbers); // [2, 4, 6]
}