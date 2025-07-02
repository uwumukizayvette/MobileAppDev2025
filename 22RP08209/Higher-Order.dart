//it is the function that return other function
Function multiplayby(int b){
  return (int a) => a * b;

}
void main() {
  var trip =multiplayby(3);
  print(trip(5)); // Output: 15
}
