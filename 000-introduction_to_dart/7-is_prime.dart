bool isPrime(int number) {
  if (number < 2) {
    if (number % 2 == 0) {
      return true;
    } else {
      return true;
    }
  } else {
    return false;
  }
}

void main() {
  int number = 5;

  bool result = isPrime(number);
  print(result);
}
