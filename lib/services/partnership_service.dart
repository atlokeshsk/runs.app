import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class PartnershipService {
  PartnershipService(this._isar);

  final Isar _isar;

  // returns true if no empty
  Future<Partnership?> entryExists(
      {required List<Player> players, required int matchId}) async {
    return await _isar.partnerships
        .filter()
        .match((q) => q.idEqualTo(matchId))
        .playersInPartnership((q) => q.idEqualTo(players[0].id))
        .and()
        .playersInPartnership((q) => q.idEqualTo(players[1].id))
        .findFirst();
  }

  Future<Partnership> createPartnership(
      {required List<Player> players,
      required Match match,
      required int partnershipOrder}) async {
    final partnership = Partnership(partnershipOrder: partnershipOrder);
    await _isar.partnerships.put(partnership);
    partnership.match.value = match;
    await partnership.match.save();
    partnership.playersInPartnership.addAll(players);
    await partnership.playersInPartnership.save();
    return partnership;
  }

  Future<void> deletePartnership(int id) async {
    await _isar.writeTxn(() async {
      await _isar.partnerships.delete(id);
    });
  }
}
