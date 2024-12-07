import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class FallOfWicketsService {
  FallOfWicketsService(Isar isar) : _isar = isar;

  final Isar _isar;

  Future<void> deleteFallOfWickets(int id) async {
    await _isar.writeTxn(() async {
      await _isar.fallOfWickets.delete(id);
    });
  }
}
