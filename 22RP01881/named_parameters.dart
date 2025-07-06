// Named parameters are enclosed in {} and called by name

void createUser({required String username, int age = 18}) {
  print('Username: $username, Age: $age');
}

void main() {
  createUser(username: 'Uwumukiza');
}
