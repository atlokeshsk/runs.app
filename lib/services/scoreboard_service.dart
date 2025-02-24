import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class ScoreboardService {
  ScoreboardService(Isar isar) : _isar = isar;
  final Isar _isar;

  Future<ScoreBoard> addPlayer(
      {required Player player,
      required Match match,
      required int position}) async {
    final scoreboard = ScoreBoard(position: position);
    await _isar.scoreBoards.put(scoreboard);
    scoreboard.player.value = player;
    await scoreboard.player.save();
    scoreboard.match.value = match;
    await scoreboard.match.save();
    return scoreboard;
  }

  // returs true if enty exits.
  Future<bool> entryExists(
      {required Player player, required Match match}) async {
    return await _isar.scoreBoards
        .filter()
        .player((q) => q.idEqualTo(player.id))
        .match((q) => q.idEqualTo(match.id))
        .isNotEmpty();
  }

  Future<void> removePlayer({
    required Player player,
    required Match match,
  }) async {
    await _isar.writeTxn(() async {
      await _isar.scoreBoards
          .filter()
          .player((q) => q.idEqualTo(player.id))
          .match((q) => q.idEqualTo(match.id))
          .deleteAll();
    });
  }

  Future<void> deleteScorebaord(int id) async {
    await _isar.writeTxn(() async {
      await _isar.scoreBoards.delete(id);
    });
  }

  Future<void> deleteScorebaords(List<int> ids) async {
    await _isar.writeTxn(
      () async {
        await _isar.scoreBoards.deleteAll(ids);
      },
    );
  }
}
