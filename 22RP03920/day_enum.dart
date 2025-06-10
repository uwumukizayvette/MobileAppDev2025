// Enum for the days of the week
enum Days {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

void main() {
  // Create a list of working days
  List<Days> workDays = [
    Days.Monday,
    Days.Tuesday,
    Days.Wednesday,
    Days.Thursday,
    Days.Friday,
  ];

  // Add Saturday to the workDays list
  workDays.add(Days.Saturday);

  // Print each day name from the workDays list
  for (var day in workDays) {
    print(day.name); // .name prints just the enum name without 'Days.'
  }
}
