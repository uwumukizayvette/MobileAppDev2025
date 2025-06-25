void main() {
    //A switch inside another switch to handle more detailed branching.
  String category = 'fruit';
  String item = 'apple';

  switch (category) {
    case 'fruit':
      switch (item) {
        case 'apple':
          print('Apple is red or green.');
          break;
        case 'banana':
          print('Banana is yellow.');
          break;
        default:
          print('Unknown fruit.');
      }
      break;
    case 'vegetable':
      print('It\'s a vegetable.');
      break;
    default:
      print('Unknown category.');
  }
}
