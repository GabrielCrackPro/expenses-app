import 'dart:math';

class RandomGenerator {
  double getDouble(int min, int max) {
    final Random random = Random();
    final double randomNumber = min + random.nextDouble() * (max - min);
    return randomNumber;
  }
}
