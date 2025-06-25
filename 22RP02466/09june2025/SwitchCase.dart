void main() {
  String day = 'Sunday';

  switch (day) {
    case 'Monday':
      print('Start of work week');
      break;
    case 'Friday':
      print('Almost weekend');
      break;
    case 'Saturday':
    case 'Sunday':
      print('Weekend!');
      break;
    default:
      print('Midweek days');
  }
}
