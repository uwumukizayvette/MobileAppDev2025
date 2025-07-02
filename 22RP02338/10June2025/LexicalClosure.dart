Function counter() {
  int count = 0;

  // This is a closure
  return () {
    count++;
    print(count);
  };
}

void main() {
  var increment = counter();
  increment(); 
  increment();
  increment();
}
