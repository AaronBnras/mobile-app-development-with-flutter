List<int> findTwoNumbersWithSum(List<int> numbers, int target) {
  Map<int, int> indeces = {};
  for (int i = 0; i < numbers.length; i++) {
    int complement = target - numbers[i];

    if (indeces.containsKey(complement)) {
      return [complement, numbers[i]];
    }

    indeces[numbers[i]] = i;
  }
  return [];
}

void main() {
  List<int> numbers = [1, 2, 3];
  int target = 4;
  List<int> result = findTwoNumbersWithSum(numbers, target);
  if (result.isNotEmpty) {
    print('${result[0]} and ${result[1]}');
  } else {
    print('no results found');
  }
}
