import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/control_section/control_section.dart';

part 'ball.g.dart';

@Collection()
class Ball {
  Ball() : datetime = DateTime.now();

  Id id = Isar.autoIncrement;

  late String name;

  late String content;

  late int over;

  late int ball;

  DateTime datetime;

  @enumerated
  late BallType ballType;

  final player = IsarLink<Player>();

  final match = IsarLink<Match>();

  @Backlink(to: 'ball')
  final score = IsarLink<Score>();

  String getName({required Runs runs}) {
    switch (runs) {
      case Runs.dot:
        return '0';
      case Runs.one:
        return '1';
      case Runs.two:
        return '2';
      case Runs.three:
        return '3';
      case Runs.four:
        return '4';
      case Runs.five:
        return '5';
      case Runs.six:
        return '6';
      case Runs.seven:
        return '7';
    }
  }

  String getContent({required Runs runs}) {
    switch (runs) {
      case Runs.dot:
        return 'Dot Ball';
      case Runs.one:
        return 'Single Run';
      case Runs.two:
        return 'Two Runs';
      case Runs.three:
        return 'Three Runs';
      case Runs.four:
        return 'Its a boundary';
      case Runs.five:
        return 'five Runs';
      case Runs.six:
        return 'Huge it\'s a Six.';
      case Runs.seven:
        return 'Seven Runs';
    }
  }

  void setBallTypeForRuns({required Runs runs}) {
    switch (runs) {
      case Runs.dot:
      case Runs.one:
      case Runs.two:
      case Runs.three:
      case Runs.five:
      case Runs.seven:
        ballType = BallType.runs;
      case Runs.four:
        ballType = BallType.four;
      case Runs.six:
        ballType = BallType.six;
    }
  }

  void addNameandContent({required Runs runs, required RunButtonType type}) {
    switch (type) {
      case RunButtonType.runs:
        name = getName(runs: runs);
        content = getContent(runs: runs);
      case RunButtonType.wide:
        name = runs == Runs.dot ? 'Wd' : '${getName(runs: runs)}Wd';
        content = runs == Runs.dot ? 'Wide' : '${getName(runs: runs)}+ Wide';
      case RunButtonType.byes:
        name = '${getName(runs: runs)}B';
        content = '${getName(runs: runs)} Byes';
      case RunButtonType.legbyes:
        name = '${getName(runs: runs)}L';
        content = '${getName(runs: runs)} LegByes';
      case RunButtonType.noball:
        name = runs == Runs.dot ? 'N' : '${getName(runs: runs)}N';
        content =
            runs == Runs.dot ? 'No Ball' : '${getContent(runs: runs)}+ Wide';
      case RunButtonType.noballByes:
        name = '${getName(runs: runs)}NB';
        content = '${getName(runs: runs)} Byes Noball';
      case RunButtonType.noballLegByes:
        name = '${getName(runs: runs)}NL';
        content = '${getName(runs: runs)} LegByes Noball';
    }
  }
}

enum BallType {
  runs,
  four,
  six,
  wide,
  noball,
  noballLegbye,
  noballBye,
  wicket,
  bye,
  legbye
}
