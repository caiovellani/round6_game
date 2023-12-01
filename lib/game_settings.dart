class GameSettings {
  static const levels = [6, 8, 10, 12, 16, 18, 20, 24, 28];

  static const cardOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];

  static gameBoardAxisCount(int level) {
    if (level < 10) {
      return 2;
    } else if (level == 10 || level == 12 || level == 18) {
      return 3;
    } else {
      return 4;
    }
  }
}
