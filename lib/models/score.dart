import 'package:isar/isar.dart';

import 'package:runs/screens/match_center/score_page/control_section/control_section.dart';
import './models.dart';

part 'score.g.dart';

@Collection()
class Score {
  Id id = Isar.autoIncrement;

  Score(
      {required this.runs,
      required this.ballsBowed,
      required this.wicketsFall,
      required this.dots,
      required this.ones,
      required this.twos,
      required this.threes,
      required this.fours,
      required this.sixes,
      required this.extras,
      required this.wide,
      required this.noball,
      required this.nextBattingPostion,
      required this.nextPartnershipOrder,
      required this.currentOvers})
      : datetime = DateTime.now();

  Score.newScore()
      : this(
          runs: 0,
          ballsBowed: 0,
          currentOvers: 0,
          wicketsFall: 0,
          dots: 0,
          ones: 0,
          twos: 0,
          threes: 0,
          fours: 0,
          sixes: 0,
          extras: 0,
          wide: 0,
          noball: 0,
          nextBattingPostion: 0,
          nextPartnershipOrder: 0,
        );

  int runs;
  int currentOvers;
  int ballsBowed;
  int wicketsFall;
  int dots;
  int ones;
  int twos;
  int threes;
  int fours;
  int sixes;
  int extras;
  int wide;
  int noball;
  int nextBattingPostion;
  int nextPartnershipOrder;
  DateTime datetime;

  final playersOnCrease = IsarLinks<Player>();
  final striker = IsarLink<Player>();
  final match = IsarLink<Match>();

  //  for undo operations
  final ball = IsarLink<Ball>();
  final batter = IsarLinks<Batter>();
  final socreboard = IsarLinks<ScoreBoard>();
  final partnershipBatterInfo = IsarLink<PartnershipBatterInfo>();
  final partnerShipInfo = IsarLink<PartnershipInfo>();
  final partnership = IsarLink<Partnership>();
  final fallOfWickets = IsarLink<FallOfWickets>();

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

  int getRuns(Runs runs) {
    switch (runs) {
      case Runs.dot:
        return 0;
      case Runs.one:
        return 1;
      case Runs.two:
        return 2;
      case Runs.three:
        return 3;
      case Runs.four:
        return 4;
      case Runs.five:
        return 5;
      case Runs.six:
        return 6;
      case Runs.seven:
        return 8;
    }
  }

  Future<void> updateStriker(
      {required Player striker,
      required Runs runs,
      required int previousOver}) async {
    // this for noball wide extras.
    if (ballsBowed == previousOver) {
      if (getRuns(runs) % 2 != 0) {
        for (final player in playersOnCrease) {
          if (player.id != striker.id) {
            this.striker.value = player;
            break;
          }
        }
      } else {
        this.striker.value = striker;
      }
    }
    // change the striker if the runs is odd and not last ball.
    else if (getRuns(runs) % 2 != 0 && ballsBowed % 6 != 0) {
      for (final player in playersOnCrease) {
        if (player.id != striker.id) {
          this.striker.value = player;
          break;
        }
      }
    } else if (getRuns(runs) % 2 == 0 && ballsBowed % 6 == 0) {
      for (final player in playersOnCrease) {
        if (player.id != striker.id) {
          this.striker.value = player;

          break;
        }
      }
    } else {
      this.striker.value = striker;
    }
    await this.striker.save(); // save striker.
  }

  @override
  String toString() {
    return '''
  Score Details:
    Runs: $runs
    Overs Completed: $ballsBowed
    Wickets Fallen: $wicketsFall
    Dots: $dots
    Ones: $ones
    Twos: $twos
    Threes: $threes
    Fours: $fours
    Sixes: $sixes
    Extras: $extras
    Striker: ${striker.value?.name ?? 'None'}
    Match ID: ${match.value?.id ?? 'None'}
    Last Ball ID: ${ball.value?.id ?? 'None'}
    ''';
  }

  Score copyWith() {
    return Score(
        runs: runs,
        currentOvers: currentOvers,
        ballsBowed: ballsBowed,
        wicketsFall: wicketsFall,
        dots: dots,
        ones: ones,
        twos: twos,
        threes: threes,
        fours: fours,
        sixes: sixes,
        extras: extras,
        wide: wide,
        noball: noball,
        nextBattingPostion: nextBattingPostion,
        nextPartnershipOrder: nextPartnershipOrder)
      ..playersOnCrease.addAll(playersOnCrease)
      ..match.value = match.value;
  }
}
