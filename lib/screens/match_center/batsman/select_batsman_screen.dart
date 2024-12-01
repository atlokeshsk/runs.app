import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class SelectBatsmanScreen extends StatelessWidget {
  const SelectBatsmanScreen({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    final teamId = score.match.value!.team.value!.id;
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Batsman'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Player>>(
                stream: context.read<PlayerService>().getBatsmans(
                    teamId: teamId, matchId: score.match.value!.id),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<List<Player>> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                      ),
                    );
                  } else {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Center(child: Text('Connection State None'));
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      case ConnectionState.active:
                        final batsmans = snapshot.data!;
                        if (batsmans.isEmpty) {
                          return Center(child: Text('Add Players'));
                        } else {
                          return SelectionList(
                              score: score, batsmans: batsmans);
                        }
                      case ConnectionState.done:
                        return Center(child: Text('Done'));
                    }
                  }
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                // will display th pop up dialog to add new player.
                onPressed: () {
                  context.push('/createplayer/$teamId');
                },
                child: Text('ADD / CREATE PLAYER'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionList extends StatefulWidget {
  const SelectionList({super.key, required this.score, required this.batsmans});

  final Score score;
  final List<Player> batsmans;

  @override
  State<SelectionList> createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {
  late final Score score;
  late final List<Player> batsmans;

  @override
  void initState() {
    super.initState(); // Always call super.initState() first

    // Initialization logic here
    score = widget.score;
    batsmans = widget.batsmans;
  }

  // toggle the players on the crease
  Future<void> togglePlayersOnCrease({required Player player}) async {
    final scoreService = context.read<ScoreService>();
    final batterService = context.read<BatterService>();

    // Check if the playersoncrease is empty.
    // if empty no more logic directly add the player.
    if (score.playersOnCrease.isEmpty) {
      await scoreService.addPlayerToPlayerOnCrease(
          score: score, player: player);
    } else if (score.playersOnCrease.length == 1) {
      if (score.playersOnCrease.contains(player)) {
        //check if the batsman is playing.
        final result = await batterService.checkPlayerIsPlaying(
            playerId: player.id, matchId: score.match.value!.id);
        if (!result) {
          await scoreService.removePlayerFromPlayerOnCrease(
              score: score, player: player);
        }
      } else {
        // adding scoreboard entry.
        await scoreService.addPlayerToPlayerOnCrease(
            score: score, player: player);
      }
    } else {
      // if both batsman are batting show the dialog not possible to add batsman.
      // check first batter is bating

      final player1Batting = await batterService.checkPlayerIsPlaying(
          playerId: score.playersOnCrease.elementAt(0).id,
          matchId: score.match.value!.id);

      final player2Batting = await batterService.checkPlayerIsPlaying(
          playerId: score.playersOnCrease.elementAt(1).id,
          matchId: score.match.value!.id);

      if (player1Batting && player2Batting) {
        // need to show alert dialog.
        AlertDialog();
        return;
      }
      // check the wheter player already present in the player on creae
      if (score.playersOnCrease.elementAt(0).id == player.id &&
          !player1Batting) {
        await scoreService.removePlayerFromPlayerOnCrease(
            score: score, player: player);
        setState(() {});
        return;
      }

      if (score.playersOnCrease.elementAt(1).id == player.id &&
          !player2Batting) {
        await scoreService.removePlayerFromPlayerOnCrease(
            score: score, player: player);
        setState(() {});
        return;
      }

      // player is not present in the playeronthecrease
      if (!player1Batting) {
        await scoreService.removePlayerFromPlayerOnCrease(
            score: score, player: score.playersOnCrease.elementAt(0));
      } else {
        await scoreService.removePlayerFromPlayerOnCrease(
            score: score, player: score.playersOnCrease.elementAt(1));
      }
      // this is used to add the player after removing the batter who is not batting.
      // the above if else only removes the player who not batting and does not add the player.
      await scoreService.addPlayerToPlayerOnCrease(
          score: score, player: player);
    }
    setState(() {});
    if (score.playersOnCrease.length == 2) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (score.playersOnCrease.isNotEmpty) {
      batsmans.sort(
        (a, b) {
          if (score.playersOnCrease.contains(a) &&
              !score.playersOnCrease.contains(b)) return -1;
          if (!score.playersOnCrease.contains(a) &&
              score.playersOnCrease.contains(b)) return 1;
          return 0;
        },
      );
    }
    return ListView.builder(
      itemCount: widget.batsmans.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(batsmans[index].name),
          selected: score.playersOnCrease.contains(batsmans[index]),
          selectedTileColor: Colors.orange.shade200,
          onTap: () async {
            await togglePlayersOnCrease(player: batsmans[index]);
          },
        );
      },
    );
  }
}
