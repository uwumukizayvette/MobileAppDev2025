//is a function that remembers variables from the place where it was created, even if used outside that scope.
Function counter() {
  int count = 0; // This variable is captured by the closure
  return () {
    count++; // Increment the captured variable
    return count; // Return the updated value
  };

}
void main() {
  var increment = counter(); // Create a closure
  print(increment()); // Output: 1
  print(increment()); // Output: 2
  print(increment()); // Output: 3
  // Each call to increment() updates and returns the count variable
}