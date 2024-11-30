import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class ScoreService {
  ScoreService(Isar isar) : _isar = isar;

  final Isar _isar;

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
    required int runs,
    required String label,
    required bool legbye,
    required bool bye,
    required bool wide,
    required bool noball,
    required Score score,
    required ScoreboardService scoreboardService,
    required BatterService batterService,
  }) async {
    // Start the write transaction
    await _isar.writeTxn(() async {
      // 1. Get the match
      final match = score.match.value!;

      // 2. Copy the score to the newScore.
      final newScore = score.copyWith();

      // 3. Save the new score to the DB
      await _isar.scores.put(newScore);
      await newScore.match.save();
      await newScore.playersOnCrease.save();

      // 4. Check and save the scoreboard entries for players if necessary
      final player1 = score.playersOnCrease.elementAtOrNull(0);
      final player2 = score.playersOnCrease.elementAtOrNull(1);

      if (player1 != null) {
        final result =
            await scoreboardService.entryExists(player: player1, match: match);
        if (!result) {
          final scoreboard = await scoreboardService.addPlayer(
            player: player1,
            match: match,
            position: newScore.nextBattingPostion,
          );
          newScore.nextBattingPostion++;
          newScore.socreboard.add(scoreboard);
        }
      }

      if (player2 != null) {
        final result =
            await scoreboardService.entryExists(player: player2, match: match);
        if (!result) {
          final scoreboard = await scoreboardService.addPlayer(
            player: player2,
            match: match,
            position: newScore.nextBattingPostion,
          );
          newScore.nextBattingPostion++;
          newScore.socreboard.add(scoreboard);
        }
      }

      // 5. Check if the batter exists
      final batter = await batterService.entryExists(
          playerId: score.striker.value!.id, matchId: match.id);

      Batter newBatter;
      if (batter != null) {
        newBatter = batter.copyWith();
      } else {
        newBatter = Batter();
        newBatter.player.value = score.striker.value!;
        newBatter.match.value = match;
      }

      // Now, save the batter outside the transaction
      await _isar.batters.put(newBatter);
      await newBatter.player.save();
      await newBatter.match.save();

      // 6. Handle runs, wide, and noball logic
      if (wide || noball) {
        // Logic for wide/noball if needed
      } else {
        newBatter.runs += runs;
        newBatter.balls++;
        await _isar.batters.put(newBatter);
        newScore.batter.value = newBatter;

        // Change the striker if necessary
        final striker = score.striker.value!;
        if (striker.id == player1?.id) {
          newScore.striker.value = player2;
          await newScore.striker.save();
        }

        // Save the new score outside the transaction
        await _isar.scores.put(newScore);
      }
    });
  }
}
