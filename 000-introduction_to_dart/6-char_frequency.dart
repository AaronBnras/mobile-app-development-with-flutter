void main() {
  String inputString = "this is dart programming";
  Map<String, int> frequencyMap = characterFrequency(inputString);

  print(frequencyMap);
}

Map<String, int> characterFrequency(String inputString) {
  Map<String, int> frequencyMap = {};
  inputString = inputString.toLowerCase();

  for (int i = 0; i < inputString.length; i++) {
    String char = inputString[i];
    if (char.contains(RegExp(r'[a-z]'))) {
      frequencyMap.update(char, (value) => value + 1, ifAbsent: () => 1);
    }
  }

  return frequencyMap;
}
