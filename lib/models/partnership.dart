import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

part 'partnership.g.dart';

@Collection()
class Partnership {
  Partnership({required this.partnershipOrder});

  Id id = Isar.autoIncrement;

  int partnershipOrder;

  final playersInPartnership = IsarLinks<Player>();

  final match = IsarLink<Match>();
}
