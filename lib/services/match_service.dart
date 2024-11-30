import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class MatchService {
  MatchService(Isar isar) : _isar = isar;

  final Isar _isar;
  late final ScoreService _scoreService;

  set scoreService(ScoreService scoreService) {
    _scoreService = scoreService;
  }

  // get all the matches
  Stream<List<Match>> getAllMatches() async* {
    yield* _isar.matches
        .where()
        .sortByDateTimeDesc()
        .watch(fireImmediately: true);
  }

  // Create a new match
  Future<int> createNewMatch({
    required Innings innings,
    required String opponentName,
    required String venue,
    required int overs,
    int? target,
    required int playersCount,
    required bool lastManStanding,
    required Team team,
  }) async {
    if (innings == Innings.second) {
      assert(target != null, 'Target is Required for the Second Innings');
    }
    final Match match;
    switch (innings) {
      case Innings.first:
        match = Match.firstInnings(
          opponentName: opponentName,
          venue: venue,
          overs: overs,
          playersCount: playersCount,
          lastManStanding: lastManStanding,
        );
      case Innings.second:
        match = Match.secondInnings(
          opponentName: opponentName,
          venue: venue,
          overs: overs,
          target: target!,
          playersCount: playersCount,
          lastManStanding: lastManStanding,
        );
    }
    late int matchId;
    await _isar.writeTxn(() async {
      matchId = await _isar.matches.put(match);

      // team will be added to the match
      match.team.value = team;
      await match.team.save();
    });
    // calls the score service to create the new score for the match.
    await _scoreService.createNewScore(match: match);

    return matchId;
  }
}
