int findIndexOfFirstOccurrence(List<int> myList, int target) {
  return myList.indexOf(target);
}

void main() {
  List<int> myList = [1, 2, 3, 4, 5];
  int target = 1;
  int index = findIndexOfFirstOccurrence(myList, target);
  String response = "targeted integer: " +
      target.toString() +
      " the index: " +
      index.toString();
  print(response);
}
