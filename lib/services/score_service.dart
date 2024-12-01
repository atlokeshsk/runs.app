import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/control_section/control_section.dart';
import 'package:runs/services/services.dart';

class ScoreService {
  ScoreService(Isar isar) : _isar = isar;

  final Isar _isar;

  late final ScoreboardService _scoreboardService;
  late final BatterService _batterService;
  late final BallService _ballService;

  set scoreboardService(ScoreboardService scoreboardService) {
    _scoreboardService = scoreboardService;
  }

  set batterService(BatterService batterService) {
    _batterService = batterService;
  }

  set ballService(BallService ballService) {
    _ballService = ballService;
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
    Batter? newbatter;
    final ball = Ball();

    if (type != RunButtonType.wide) {
      newbatter = await _batterService.getBatter(player: striker, match: match);
    }

    // add the newscore to db.
    await _isar.writeTxn(() async {
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
      }

      // scoreboard entry compled

      switch (type) {
        case RunButtonType.runs:
          newscore.oversCompleted++;
          ball.ballType = BallType.runs;
          newbatter!.addRuns(runs: runs);
          newbatter.balls++;

        case RunButtonType.wide:
          newscore.extras++;
          newscore.wide++;
          newscore.runs++;
          ball.ballType = BallType.wide;

        case RunButtonType.byes:
          newscore.oversCompleted++;
          newscore.extras++;
          ball.ballType = BallType.runs;
          newbatter!.balls++;
          newbatter.dots++;

        case RunButtonType.legbyes:
          newscore.oversCompleted++;
          newscore.extras++;
          ball.ballType = BallType.runs;
          newbatter!.balls++;
          newbatter.dots++;

        case RunButtonType.noball:
          newscore.extras++;
          newscore.noball++;
          ball.ballType = BallType.noball;
          newbatter!.addRuns(runs: runs);
          newbatter.balls++;

        case RunButtonType.noballByes:
          newscore.extras++;
          newscore.noball++;
          ball.ballType = BallType.noballBye;
          newbatter!.balls++;
          newbatter.dots++;

        case RunButtonType.noballLegByes:
          newscore.extras++;
          newscore.noball++;
          ball.ballType = BallType.noballLegbye;
          newbatter!.balls++;
          newbatter.dots++;
      }
      if (newbatter != null) {
        await _isar.batters.put(newbatter);
      }
      // add the ball related stuff.
      ball.match.value = match;
      ball.over = newscore.oversCompleted;
      ball.addNameandContent(runs: runs, type: type);
      ball.player.value = striker;
      await _isar.balls.put(ball);
      await ball.player.save();
      await ball.match.save();

      newscore.addRuns(runs: runs);
      newscore.batter.value = newbatter; // batter
      newscore.ball.value = ball; // ball
      await _isar.scores.put(newscore); // putting.

      await newscore.match.save(); // match save save.
      await newscore.playersOnCrease.save(); // match save
      await newscore.ball.save(); //ball save
      await newscore.batter.save(); // batter save
      await newscore.socreboard.save(); // object save
      await newscore.updateStriker(
          striker: striker, runs: runs, previousOver: score.oversCompleted);
    });
  }

  Future<void> undoScore({required Score score}) async {
    final ball = score.ball.value;
    final batter = score.batter.value;
    final scoreboard = score.socreboard.value;

    if (ball != null) {
      await _ballService.deleteBall(ball.id);
    }
    if (batter != null) {
      await _batterService.deleteBatter(batter.id);
    }
    if (scoreboard != null) {
      await _scoreboardService.deleteScorebaord(scoreboard.id);
    }
    await _isar.writeTxn(() async {
      await _isar.scores.delete(score.id);
    });
  }
}
