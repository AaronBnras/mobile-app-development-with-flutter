List<int> factorizeToPrimeNumbers(int number) {
  List<int> primeFactor = [];

  while (number % 2 == 0) {
    primeFactor.add(2);
    number = number ~/ 2;
  }
  for (var i = 3; i <= number; i++) {
    while (number % i == 0) {
      primeFactor.add(i);
      number = number ~/ i;
    }
  }

  if (number > 2) {
    primeFactor.add(number);
  }
  return primeFactor;
}

void main() {
  int number = 200;
  List<int> primefactor = factorizeToPrimeNumbers(number);

  print('the prime factor of $number is $primefactor');
}
