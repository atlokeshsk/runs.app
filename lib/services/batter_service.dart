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

  Future<Batter?> entryExists(
      {required int playerId, required int matchId}) async {
    return await _isar.batters
        .filter()
        .player((q) => q.idEqualTo(playerId))
        .match((q) => q.idEqualTo(matchId))
        .sortByDateTimeDesc()
        .findFirst();
  }
}
