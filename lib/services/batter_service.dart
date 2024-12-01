import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class BatterService {
  BatterService(Isar isar) : _isar = isar;

  final Isar _isar;

  Future<bool> checkPlayerIsPlaying(
      {required int playerId, required int matchId}) async {
    final count = await _isar.batters
        .filter()
        .player((q) => q.idEqualTo(playerId))
        .match((q) => q.idEqualTo(matchId))
        .sortByDateTimeDesc()
        .limit(1)
        .count();
    if (count != 0) {
      return true;
    }
    return false;
  }

  // returns true if entry exist
  Future<Batter?> entryExists(
      {required int playerId, required int matchId}) async {
    return await _isar.batters
        .filter()
        .player((q) => q.idEqualTo(playerId))
        .match((q) => q.idEqualTo(matchId))
        .sortByDateTimeDesc()
        .findFirst();
  }

  // get the batter if no batter exists.
  // create the new batter and return that batter.
  Future<Batter> getBatter({
    required Player player,
    required Match match,
  }) async {
    late final Batter newbatter;

    final batter = await _isar.batters
        .filter()
        .player((q) => q.idEqualTo(player.id))
        .match((q) => q.idEqualTo(match.id))
        .sortByDateTimeDesc()
        .findFirst();

    if (batter == null) {
      newbatter = Batter();
    } else {
      print("battter id -->" + batter.id.toString());
      newbatter = batter.copyWith();
    }
    await _isar.writeTxn(
      () async {
        await _isar.batters.put(newbatter);
        newbatter.player.value = player;
        await newbatter.player.save();
        newbatter.match.value = match;
        await newbatter.match.save();
      },
    );
    return newbatter;
  }
}
