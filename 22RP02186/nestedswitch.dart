void main() {
  String country = 'Rwanda';
  String city = 'Kigali';

  switch (country) {
    case 'Rwanda':
      switch (city) {
        case 'Kigali':
          print('You are in Kigali, Rwanda.');
          break;
      }
      break;
    default:
      print('Unknown location');
  }
}
