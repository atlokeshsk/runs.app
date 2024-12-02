import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class PartnershipBatterInfoService {
  PartnershipBatterInfoService(this._isar);

  final Isar _isar;

  Future<PartnershipBatterInfo> getOrCreateBatter(
      {required Player player,
      required Partnership partnership,
      required Match match}) async {
    final PartnershipBatterInfo newbatter;

    final batter = await _isar.partnershipBatterInfos
        .filter()
        .match((q) => q.idEqualTo(match.id))
        .player((q) => q.idEqualTo(player.id))
        .partnership((q) => q.idEqualTo(partnership.id))
        .sortByDateTimeDesc()
        .findFirst();

    if (batter == null) {
      newbatter = PartnershipBatterInfo();
    } else {
      newbatter = batter.copyWith();
    }
    await _isar.writeTxn(() async {
      await _isar.partnershipBatterInfos.put(newbatter);
      newbatter.player.value = player;
      await newbatter.player.save();
      newbatter.partnership.value = partnership;
      await newbatter.partnership.save();
      newbatter.match.value = match;
      await newbatter.match.save();
    });
    return newbatter;
  }

  Future<PartnershipBatterInfo?> getBatter(
      {required Player player,
      required Partnership partnership,
      required Match match}) async {
    return await _isar.partnershipBatterInfos
        .filter()
        .match((q) => q.idEqualTo(match.id))
        .player((q) => q.idEqualTo(player.id))
        .partnership((q) => q.idEqualTo(partnership.id))
        .sortByDateTimeDesc()
        .findFirst();
  }

  Future<void> deleteBatterInfo(int id) async {
    await _isar.writeTxn(() async {
      await _isar.partnershipBatterInfos.delete(id);
    });
  }
}
