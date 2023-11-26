import 'dart:math';

int getSmallerIntegers(List<int> myList) {
  return myList.reduce(min);
}

void main() {
  List<int> myList = [1, 2, 3, 4, 5, 6, 7, 8];
  print(getSmallerIntegers(myList));
}
