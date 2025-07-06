enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

void main() {
  // Print all days
  for (var day in Day.values) {
    print(day);
  }

  // Access a specific day
  Day today = Day.monday;
  print("Today is: $today");
}
