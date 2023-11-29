bool isPrime(int number) {
  if (number % 2 == 0) {
    return false;
  } else {
    return true;
  }
}

void main() {
  int number = 2;

  bool result = isPrime(number);
  print(result);
}
