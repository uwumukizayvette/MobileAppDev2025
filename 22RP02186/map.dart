void main() {
  Map<String, String> capitals = {
    'Rwanda': 'Kigali',
    'Kenya': 'Nairobi',
  };
  capitals['Uganda'] = 'Kampala';
  print(capitals);
  print('Capital of Kenya: ${capitals['Kenya']}');
}
