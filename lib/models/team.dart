import 'package:isar/isar.dart';
import './models.dart';

part 'team.g.dart';

@Collection()
class Team {
  Team({required this.name});

  Id id = Isar.autoIncrement;

  String name;

  int won = 0;

  int lost = 0;

  int draw = 0;

  @Backlink(to: 'teams')
  final players = IsarLinks<Player>();

  @Backlink(to: 'team')
  final matches = IsarLinks<Match>();
}
