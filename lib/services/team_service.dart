import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class TeamService {
  TeamService(Isar isar) : _isar = isar;
  final Isar _isar;

  // List the team.
  Stream<List<Team>> getAllTeams() async* {
    yield* _isar.teams.where().sortByName().watch(
          fireImmediately: true,
        );
  }

  // Create the new team.
  Future<Team> createNewTeam(String name) async {
    final team = Team(name: name);
    await _isar.writeTxn(() async {
      await _isar.teams.put(team);
    });
    return team;
  }
}
