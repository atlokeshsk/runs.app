import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

part 'fall_of_wickets.g.dart';

@Collection()
class FallOfWickets {
  FallOfWickets({
    required this.over,
    required this.ball,
    required this.run,
  }) : datetime = DateTime.now();

  Id id = Isar.autoIncrement;

  final int run;

  final int over;

  final int ball;

  final DateTime datetime;

  final player = IsarLink<Player>();

  final match = IsarLink<Match>();
}
