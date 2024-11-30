import 'package:isar/isar.dart';
import './models.dart';

part 'score.g.dart';

@Collection()
class Score {
  Id id = Isar.autoIncrement;

  Score(
      {required this.runs,
      required this.oversCompleted,
      required this.wicketsFall,
      required this.dots,
      required this.ones,
      required this.twos,
      required this.threes,
      required this.fours,
      required this.sixes,
      required this.extras,
      required this.nextBattingPostion});

  Score.newScore()
      : this(
          runs: 0,
          oversCompleted: 0,
          wicketsFall: 0,
          dots: 0,
          ones: 0,
          twos: 0,
          threes: 0,
          fours: 0,
          sixes: 0,
          extras: 0,
          nextBattingPostion: 0,
        );

  int runs;
  int oversCompleted;
  int wicketsFall;
  int dots;
  int ones;
  int twos;
  int threes;
  int fours;
  int sixes;
  int extras;
  int nextBattingPostion;

  final playersOnCrease = IsarLinks<Player>();
  final striker = IsarLink<Player>();
  final match = IsarLink<Match>();
  final ball = IsarLink<Ball>();
  final batter = IsarLink<Batter>();
  final socreboard = IsarLinks<ScoreBoard>();

  @override
  String toString() {
    return '''
  Score Details:
    Runs: $runs
    Overs Completed: $oversCompleted
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

  Score copyWith({
    int? runs,
    int? oversCompleted,
    int? wicketsFall,
    int? dots,
    int? ones,
    int? twos,
    int? threes,
    int? fours,
    int? sixes,
    int? extras,
    int? nextBattingPostion,
    IsarLinks<Player>? playersOnCrease,
    IsarLink<Player>? striker,
    IsarLink<Match>? match,
    IsarLink<Ball>? ball,
    IsarLink<Batter>? batter,
    IsarLinks<ScoreBoard>? socreboard,
  }) {
    return Score(
      runs: runs ?? this.runs,
      oversCompleted: oversCompleted ?? this.oversCompleted,
      wicketsFall: wicketsFall ?? this.wicketsFall,
      dots: dots ?? this.dots,
      ones: ones ?? this.ones,
      twos: twos ?? this.twos,
      threes: threes ?? this.threes,
      fours: fours ?? this.fours,
      sixes: sixes ?? this.sixes,
      extras: extras ?? this.extras,
      nextBattingPostion: nextBattingPostion ?? this.nextBattingPostion,
    )
      ..playersOnCrease.addAll(playersOnCrease ?? this.playersOnCrease)
      ..striker.value = striker?.value ?? this.striker.value
      ..match.value = match?.value ?? this.match.value
      ..ball.value = ball?.value ?? this.ball.value
      ..batter.value = batter?.value ?? this.batter.value
      ..socreboard.addAll(socreboard ?? this.socreboard);
  }
}
