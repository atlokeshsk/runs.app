import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class PartnershipInfoService {
  PartnershipInfoService(this._isar);

  final Isar _isar;

  Future<PartnershipInfo> getOrCreatePartnershipInfo(
      {required Partnership partnership, required Match match}) async {
    final PartnershipInfo newpartnershipInfo;

    final result = await _isar.partnershipInfos
        .filter()
        .match((q) => q.idEqualTo(match.id))
        .partnership((q) => q.idEqualTo(partnership.id))
        .sortByDatetimeDesc()
        .findFirst();
    if (result == null) {
      newpartnershipInfo = PartnershipInfo();
    } else {
      newpartnershipInfo = result.copyWith();
    }

    await _isar.writeTxn(() async {
      await _isar.partnershipInfos.put(newpartnershipInfo);
      newpartnershipInfo.partnership.value = partnership;
      await newpartnershipInfo.partnership.save();
      newpartnershipInfo.match.value = match;
      await newpartnershipInfo.match.save();
    });
    return newpartnershipInfo;
  }

  Future<PartnershipInfo?> getPartnership(
      {required Partnership partnership, required Match match}) async {
    return await _isar.partnershipInfos
        .filter()
        .match((q) => q.idEqualTo(match.id))
        .partnership((q) => q.idEqualTo(partnership.id))
        .sortByDatetimeDesc()
        .findFirst();
  }

  Future<void> deletePartnershipInfo(int id) async {
    await _isar.writeTxn(() async {
      await _isar.partnershipInfos.delete(id);
    });
  }
}
