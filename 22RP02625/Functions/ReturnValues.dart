// Function with return value
double calculateArea(double width, double height) {
  return width * height;
}

void main() {
  double area = calculateArea(5.0, 3.0);
  print('Area: $area'); // Area: 15.0
}