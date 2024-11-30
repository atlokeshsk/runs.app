import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:runs/models/models.dart';

class IsarService {
  late Isar _isar;

  /// initalize the db.
  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        BallSchema,
        BatterSchema,
        MatchSchema,
        PlayerSchema,
        ScoreSchema,
        TeamSchema,
        ScoreBoardSchema,
      ],
      directory: dir.path,
      name: 'runsdb',
    );
  }

  Isar get isar => _isar;
}
