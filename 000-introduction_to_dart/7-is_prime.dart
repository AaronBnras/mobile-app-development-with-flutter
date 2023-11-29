bool isPrime(int number) {
  if (number < 2) {
    return false;
  }
  for (int i = 2; i <= number / 2; i++) {
    if (number % 2 == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int number = 29;

  bool result = isPrime(number);
  print(result);
}
