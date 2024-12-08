import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/control_section/control_section.dart';

part 'batter.g.dart';

@Collection()
class Batter {
  Batter() : dateTime = DateTime.now();

  Id id = Isar.autoIncrement;

  int runs = 0;
  int balls = 0;
  int dots = 0;
  int ones = 0;
  int twos = 0;
  int threes = 0;
  int fours = 0;
  int sixes = 0;

  DateTime dateTime;

  @enumerated
  BatterStatus status = BatterStatus.playing;

  @Backlink(to: 'batters')
  final player = IsarLink<Player>();

  @Backlink(to: 'batter')
  final score = IsarLink<Score>();

  final match = IsarLink<Match>();

  void addRuns({required Runs runs}) {
    switch (runs) {
      case Runs.dot:
        dots++;
      case Runs.one:
        this.runs += 1;
        ones++;
      case Runs.two:
        this.runs += 2;
        twos++;
      case Runs.three:
        this.runs += 3;
        threes++;
      case Runs.four:
        this.runs += 4;
        fours++;
      case Runs.five:
        this.runs += 5;
      case Runs.six:
        this.runs += 6;
        sixes++;
      case Runs.seven:
        this.runs += 7;
    }
  }

  Batter copyWith() {
    return Batter()
      ..runs = runs
      ..balls = balls
      ..dots = dots
      ..ones = ones
      ..twos = twos
      ..threes = threes
      ..fours = fours
      ..sixes = sixes
      ..status = status
      ..player.value = player.value
      ..match.value = match.value;
  }

  String getStrikRate() {
    return ((runs / balls) * 100).toStringAsFixed(0);
  }

  String statusToString() {
    switch (status) {
      case BatterStatus.bowled:
        return 'Bowled';
      case BatterStatus.caugth:
        return 'Caught';
      case BatterStatus.lbw:
        return 'lbw';
      case BatterStatus.htiwicket:
        return 'Hitwicet';
      case BatterStatus.stupmed:
        return 'Stumped';
      case BatterStatus.runout:
        return 'Run out';
      case BatterStatus.retiredOut:
        return 'Retired out';
      case BatterStatus.retiredHurt:
        return 'Retired Hurt';
      case BatterStatus.playing:
        if (match.value!.status == MatchStatus.completed) {
          return 'Not Out';
        }
        return 'Batting';
    }
  }
}

enum BatterStatus {
  bowled,
  caugth,
  lbw,
  htiwicket,
  stupmed,
  runout,
  retiredOut,
  retiredHurt,
  playing,
}
