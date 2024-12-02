import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

part 'partnership_info.g.dart';

@Collection()
class PartnershipInfo {
  Id id = Isar.autoIncrement;

  int runs = 0;

  int balls = 0;

  final partnership = IsarLink<Partnership>();
}
