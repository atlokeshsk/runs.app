import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

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

  final match = IsarLink<Match>();

  Batter copyWith({
    int? runs,
    int? balls,
    int? dots,
    int? ones,
    int? twos,
    int? threes,
    int? fours,
    int? sixes,
    DateTime? dateTime,
    BatterStatus? status,
    IsarLink<Player>? player,
    IsarLink<Match>? match,
  }) {
    return Batter()
      ..runs = runs ?? this.runs
      ..balls = balls ?? this.balls
      ..dots = dots ?? this.dots
      ..ones = ones ?? this.ones
      ..twos = twos ?? this.twos
      ..threes = threes ?? this.threes
      ..fours = fours ?? this.fours
      ..sixes = sixes ?? this.sixes
      ..dateTime = dateTime ?? this.dateTime
      ..status = status ?? this.status
      ..player.value = player?.value ?? this.player.value
      ..match.value = match?.value ?? this.match.value;
  }
}

enum BatterStatus {
  out,
  runout,
  bowled,
  lbw,
  caugth,
  playing,
  retiredHurt,
  notout,
}
