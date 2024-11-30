import 'package:isar/isar.dart';
import './models.dart';

part 'player.g.dart';

@Collection()
class Player {
  Player({required this.name});

  Id id = Isar.autoIncrement;

  String name;

  final teams = IsarLinks<Team>();

  final batters = IsarLinks<Batter>();

  @Backlink(to: 'player')
  final ball = IsarLinks<Ball>();
}
