import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';
import 'player.dart';
import 'match.dart';

part 'scoreboard.g.dart';

@Collection()
class ScoreBoard {
  ScoreBoard({required this.position});

  Id id = Isar.autoIncrement;

  int position;

  final player = IsarLink<Player>();

  final match = IsarLink<Match>();

  @Backlink(to: 'socreboard')
  final score = IsarLink<Score>();
}
