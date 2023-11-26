import 'dart:io';

void printRightAngleTriangle(int height) {
  for (int i = 1; i <= height; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write('*');
    }
    stdout.writeln();
  }
}

void main() {
  int height = 5;
  printRightAngleTriangle(height);
}
