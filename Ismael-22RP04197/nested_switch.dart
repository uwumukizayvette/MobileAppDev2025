// Example of Nested Switch
void main() {
  String category = "A";
  int score = 85;

  switch (category) {
    case "A":
      switch (score) {
        case 85:
          print("Excellent");
          break;
        default:
          print("Good");
      }
      break;
    default:
      print("Unknown");
  }
}
