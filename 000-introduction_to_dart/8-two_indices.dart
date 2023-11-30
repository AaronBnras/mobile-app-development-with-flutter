List<int> findTwoNumbersWithSum(List<int> numbers, int target) {
  Map<int, int> indices = {};
  for (int i = 0; i < numbers.length; i++) {
    int complement = target - numbers[i];

    if (indices.containsKey(complement)) {
      return [indices[complement]!, i];
    }

    indices[numbers[i]] = i;
  }
  return [];
}

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  int target = 25;
  List<int> result = findTwoNumbersWithSum(numbers, target);
  if (result.isNotEmpty) {
    print('$result');
  } else {
    print('no results found');
  }
}
