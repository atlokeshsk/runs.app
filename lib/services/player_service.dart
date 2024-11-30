import 'package:isar/isar.dart';
import 'package:runs/models/models.dart';

class PlayerService {
  PlayerService(Isar isar) : _isar = isar;

  final Isar _isar;

  // returns the players who are eligibe to bat.
  //TODO: need to add filters to get only the players eligible to bat.
  Stream<List<Player>> getBatsmans({
    required int teamId,
    required int matchId,
  }) async* {
    yield* _isar.players
        .filter()
        .teams((team) {
          return team.idEqualTo(teamId);
        })
        .not()
        .batters((batter) {
          return batter
              .match((match) => match.idEqualTo(matchId))
              .statusEqualTo(BatterStatus.bowled)
              .or()
              .statusEqualTo(BatterStatus.caugth)
              .or()
              .statusEqualTo(BatterStatus.lbw)
              .or()
              .statusEqualTo(BatterStatus.out)
              .or()
              .statusEqualTo(BatterStatus.runout);
        })
        .sortByName()
        .watch(fireImmediately: true);
  }

  Future<Player> createPlayerAndToTeam(
      {required String name, required int teamId}) async {
    final player = Player(name: name);
    await _isar.writeTxn(() async {
      await _isar.players.put(player);
      final team = await _isar.teams.get(teamId);
      player.teams.add(team!);
      await player.teams.save();
    });
    return player;
  }

  Future<void> addTeamToPlayer(
      {required int playerId, required int teamId}) async {
    await _isar.writeTxn(
      () async {
        final player = await _isar.players.get(playerId);
        final team = await _isar.teams.get(teamId);
        player!.teams.add(team!);
        player.teams.save();
      },
    );
  }

  Stream<List<Player>> getAllPlayers() async* {
    yield* _isar.players.where().sortByName().watch(
          fireImmediately: true,
        );
  }
}
