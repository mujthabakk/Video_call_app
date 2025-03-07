import 'dart:math';

class RandomGenerator {
  static final _random = Random();

  static String generateRandomChannel() {
    const String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return 'room_${String.fromCharCodes(List.generate(
      8,
      (_) => chars.codeUnitAt(_random.nextInt(chars.length)),
    ))}';
  }
}
