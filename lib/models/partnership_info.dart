import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/control_section/control_section.dart';

part 'partnership_info.g.dart';

@Collection()
class PartnershipInfo {
  PartnershipInfo() : datetime = DateTime.now();

  Id id = Isar.autoIncrement;

  int runs = 0;

  int balls = 0;

  int dots = 0;

  int ones = 0;

  int twos = 0;

  int threes = 0;

  int fours = 0;

  int sixes = 0;

  DateTime datetime;

  final partnership = IsarLink<Partnership>();

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

  PartnershipInfo copyWith() {
    return PartnershipInfo()
      ..runs = runs
      ..balls = balls
      ..dots = dots
      ..ones = ones
      ..twos = twos
      ..threes = threes
      ..fours = fours
      ..sixes = sixes;
  }
}
