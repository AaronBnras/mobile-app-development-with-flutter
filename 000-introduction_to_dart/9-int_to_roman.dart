String inToRoman(int number) {
  if (number <= 0 || number > 3999) {
    return 'out of range';
  }

  final List<String> Roman = ['M', 'D', 'C', 'L', 'X', 'V', 'I'];
  final List<int> Values = [1000, 500, 100, 50, 10, 5, 1];
  String result = '';

  for (int i = 0; i < Values; i++) {
    while (number >= Values[i]) {
      result += Roman[i];
      number -= Values[i];
    }
  }
  return result;
}

void main() {
  int number = 88;

  String result = inToRoman(number);

  print(result);
}
