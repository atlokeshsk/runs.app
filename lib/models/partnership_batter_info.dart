import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

part 'partnership_batter_info.g.dart';

@Collection()
class PartnershipBatterInfo {
  PartnershipBatterInfo() : dateTime = DateTime.now();

  Id id = Isar.autoIncrement;

  int runs = 0;

  int balls = 0;

  DateTime dateTime;

  final player = IsarLink<Player>();

  final partnership = IsarLink<Partnership>();
}
