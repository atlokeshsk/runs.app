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
