// Closures can remember variables even after outer function ends

Function makeMultiplier(int multiplier) {
  return (int value) => value * multiplier; // Closure
}

void main() {
  var triple = makeMultiplier(3);
  print(triple(4)); // 12
}

