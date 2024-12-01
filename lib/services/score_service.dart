import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/control_section/control_section.dart';
import 'package:runs/services/services.dart';

class ScoreService {
  ScoreService(Isar isar) : _isar = isar;

  final Isar _isar;

  late final ScoreboardService _scoreboardService;
  late final BatterService _batterService;

  set scoreboardService(ScoreboardService scoreboardService) {
    _scoreboardService = scoreboardService;
  }

  set batterService(BatterService batterService) {
    _batterService = batterService;
  }

  // Create the new score for the match and add the match  to the score.
  Future<void> createNewScore({required Match match}) async {
    final score = Score.newScore();
    await _isar.writeTxn(() async {
      // score added to the database.
      await _isar.scores.put(score);

      // link match with the score
      score.match.value = match;
      await score.match.save();
    });
  }

  // Stream the latest score of the match
  Stream<List<Score>> getLatestScore({required int matchId}) async* {
    yield* _isar.scores
        .filter()
        .match((match) {
          return match.idEqualTo(matchId);
        })
        .sortByDatetimeDesc()
        .limit(1)
        .watch(fireImmediately: true);
  }

  //Add the given player to the player on crease for the given score object.
  Future<void> addPlayerToPlayerOnCrease(
      {required Score score, required Player player}) async {
    await _isar.writeTxn(() async {
      score.playersOnCrease.add(player);
      await score.playersOnCrease.save();
      score.nextBattingPostion++;
      //to unlink the striker
      await score.striker.reset();
      await _isar.scores.put(score);
    });
  }

  Future<void> removePlayerFromPlayerOnCrease(
      {required Score score, required Player player}) async {
    await _isar.writeTxn(() async {
      score.playersOnCrease.remove(player);
      await score.playersOnCrease.save();
      //to unlink the striker
      await score.striker.reset();
      await _isar.scores.put(score);
    });
  }

  Future<void> updateStriker(
      {required Score score, required Player player}) async {
    await _isar.writeTxn(() async {
      score.striker.value = player;
      await score.striker.save();
      await _isar.scores.put(score);
    });
  }

  Future<void> addRuns({
    required Runs runs,
    required Score score,
    required RunButtonType type,
  }) async {
    final match = score.match.value!;
    final newscore = score.copyWith();
    final striker = score.striker.value!;
    late final Batter newbatter;

    if (type != RunButtonType.wide) {
      newbatter = await _batterService.getBatter(player: striker, match: match);
    }

    // add the newscore to db.
    await _isar.writeTxn(() async {
      await _isar.scores.put(newscore);
      await newscore.match.save();
      await newscore.playersOnCrease.save();

      // adding the scoreboard entry.
      final scoreboardEntryExists =
          await _scoreboardService.entryExists(player: striker, match: match);
      if (!scoreboardEntryExists) {
        // add the scoreboard entry for the player.
        final scoreboard = await _scoreboardService.addPlayer(
          player: striker,
          match: match,
          position: newscore.nextBattingPostion++,
        );
        newscore.socreboard.value = scoreboard;
        await newscore.socreboard.save();
      }
      await newscore.socreboard.save();
      // scoreboard entry compled

      final ball = Ball();

      switch (type) {
        case RunButtonType.runs:
          newscore.addRuns(runs: runs);
          newscore.oversCompleted++;

          ball.ballType = BallType.runs;
          ball.addNameandContent(runs: runs, type: type);

          ball.player.value = striker;

          newbatter.addRuns(runs: runs);
          newbatter.balls++;
          await _isar.batters.put(newbatter);
          newscore.batter.value = newbatter;

        case RunButtonType.wide:
          newscore.addRuns(runs: runs);
          newscore.extras++;
          newscore.wide++;
        case RunButtonType.byes:
        // TODO: Handle this case.
        case RunButtonType.legbyes:
        // TODO: Handle this case.
        case RunButtonType.noball:
        // TODO: Handle this case.
        case RunButtonType.noballByes:
        // TODO: Handle this case.
        case RunButtonType.noballLegByes:
        // TODO: Handle this case.
      }

      // add the ball related stuff.
      ball.over = newscore.oversCompleted;
      await _isar.balls.put(ball);
      ball.player.value = score.striker.value;
      await ball.player.save();

      // update ther striker
      newscore.ball.value = ball;
      await newscore.ball.save();
      await newscore.updateStriker(striker: striker, runs: runs);
      await _isar.scores.put(newscore);
    });
  }
}
