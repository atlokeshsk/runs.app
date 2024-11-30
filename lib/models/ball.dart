import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

part 'ball.g.dart';

@Collection()
class Ball {
  Ball({
    required this.name,
    required this.content,
    required this.over,
    required this.ballType,
  });

  Id id = Isar.autoIncrement;

  String name;

  String content;

  int over;

  @enumerated
  BallType ballType;

  final player = IsarLink<Player>();

  @Backlink(to: 'ball')
  final score = IsarLink<Score>();
}

enum BallType {
  runs,
  four,
  six,
  wide,
  noball,
  wicket,
}
