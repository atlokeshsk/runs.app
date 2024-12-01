import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class BallService {
  BallService(Isar isar) : _isar = isar;

  final Isar _isar;

  Future<void> deleteBall(int id) async {
    await _isar.writeTxn(() async {
      await _isar.balls.delete(id);
    });
  }

  // Future<List<Ball>> getCurrentOverBalls({required Match match,required Score score}){

  // }
}
