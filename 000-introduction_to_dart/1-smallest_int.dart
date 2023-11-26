import 'dart:math';

num getSmallerIntegers(List<num> myList) {
  return myList.reduce(min);
}

void main() {
  List<num> myList = [1.1, 0.22, 3, 4, 5, 6, 7, 8];
  print(getSmallerIntegers(myList));
}
