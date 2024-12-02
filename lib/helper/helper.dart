extension CricketMetrics on int {
  String get overs {
    return '${this ~/ 6}.${this % 6}';
  }

  String currentRunRate(int balls) {
    final oversFaced = double.parse(balls.overs);
    return (this / oversFaced).toStringAsFixed(2);
  }

  String requiredRunRate(
      {required int currentRuns, required int ballsRemaining}) {
    final overRemaining = double.parse(ballsRemaining.overs);
    return ((this - currentRuns) / overRemaining).toStringAsFixed(2);
  }
}

extension StringExtensions on String {
  /// Gets the initials from a name.
  /// If the name has multiple words, it takes the first letter of the first two words.
  /// If the name has only one word, it takes the first two letters.
  String getInitials() {
    final words = split(' ');
    if (words.length > 1) {
      return (words[0][0] + words[1][0]).toUpperCase();
    }
    return substring(0, 2).toUpperCase();
  }
}
