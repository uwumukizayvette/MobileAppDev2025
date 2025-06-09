void main() {
  Map<String, dynamic> student = {
    'name': 'Alice',
    'age': 21,
    'isGraduated': false
  };
  print(student['name']);
  student['age'] = 22;
  print(student);
}
