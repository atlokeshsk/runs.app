import 'package:isar/isar.dart';
import './models.dart';

part 'match.g.dart';

@Collection(accessor: 'matches')
class Match {
  Match({
    required this.opponentName,
    required this.venue,
    required this.innings,
    required this.overs,
    required this.playersCount,
    required this.lastManStanding,
    this.status = MatchStatus.inprogress,
    this.countRunsForWide = true,
    this.countRunsForNoBall = true,
    this.target,
  }) : dateTime = DateTime.now();

  Match.firstInnings({
    required String opponentName,
    required String venue,
    required int overs,
    required int playersCount,
    required bool lastManStanding,
  }) : this(
          opponentName: opponentName,
          venue: venue,
          innings: Innings.first,
          overs: overs,
          playersCount: playersCount,
          lastManStanding: lastManStanding,
        );

  Match.secondInnings({
    required String opponentName,
    required String venue,
    required int overs,
    required int playersCount,
    required bool lastManStanding,
    required int target,
  }) : this(
          opponentName: opponentName,
          venue: venue,
          innings: Innings.second,
          overs: overs,
          playersCount: playersCount,
          target: target,
          lastManStanding: lastManStanding,
        );

  Id id = Isar.autoIncrement;

  String opponentName;

  String venue;

  @enumerated
  Innings innings;

  int? target;

  int overs;

  int playersCount;

  bool countRunsForWide;

  bool countRunsForNoBall;

  bool lastManStanding;

  @enumerated
  MatchStatus status;

  DateTime dateTime;

  final team = IsarLink<Team>();

  @Backlink(to: 'match')
  final score = IsarLinks<Score>();

  @Backlink(to: 'match')
  final batters = IsarLinks<Batter>();

  @Backlink(to: 'match')
  final scoreboards = IsarLinks<ScoreBoard>();

  @Backlink(to: 'match')
  final partnerships = IsarLinks<Partnership>();

  @Backlink(to: 'match')
  final partnershipInfos = IsarLinks<PartnershipInfo>();

  @Backlink(to: 'match')
  final partnershipBatsmanInfos = IsarLinks<PartnershipBatterInfo>();

  @Backlink(to: 'match')
  final fallOfWickets = IsarLinks<FallOfWickets>();
}

enum Innings {
  first,
  second,
}

enum MatchStatus {
  inprogress,
  completed,
}
