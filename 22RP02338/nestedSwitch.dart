void main(){
    String department = 'IT';
String role = 'Developer';

switch (department) {
  case 'IT':
    switch (role) {
      case 'Developer':
        print('Write code');
        break;
      case 'Tester':
        print('Test software');
        break;
    }
    break;
  case 'HR':
    print('Manage people');
    break;
  default:
    print('Unknown department');
}

}