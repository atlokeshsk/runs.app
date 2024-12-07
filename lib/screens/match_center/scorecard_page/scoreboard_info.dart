import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:runs/main.dart';
import 'package:runs/models/batter.dart';
import 'package:runs/models/models.dart';

class ScoreboardInfo extends StatelessWidget {
  const ScoreboardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final match = context.read<Match>();

    final scoreboard = match.scoreboards;

    // Adjust multiplier as needed
    final headerStyle = TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Colors.green,
    );

    return Column(
      children: [
        Row(
          children: [
            Expanded(flex: 3, child: Text('Batsman', style: headerStyle)),
            Expanded(child: Center(child: Text('R', style: headerStyle))),
            Expanded(child: Center(child: Text('B', style: headerStyle))),
            Expanded(child: Center(child: Text('0s', style: headerStyle))),
            Expanded(child: Center(child: Text('4s', style: headerStyle))),
            Expanded(child: Center(child: Text('6s', style: headerStyle))),
            Expanded(child: Center(child: Text('SR', style: headerStyle))),
          ],
        ),
        Divider(),
        ListView.separated(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final player = scoreboard.elementAt(index).player.value!;
            final batter = match.batters
                .filter()
                .player((q) => q.idEqualTo(player.id))
                .sortByDateTimeDesc()
                .findFirstSync()!;
            return ScoreboardRow(batter: batter, player: player);
          },
          itemCount: scoreboard.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        )
      ],
    );
  }
}

class ScoreboardRow extends StatelessWidget {
  const ScoreboardRow({super.key, required this.batter, required this.player});
  final Batter batter;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player.name,
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              Text(batter.statusToString())
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              batter.runs.toString(),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              batter.balls.toString(),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              batter.dots.toString(),
            ),
          ),
        ),
        Expanded(
            child: Center(
          child: Text(
            batter.fours.toString(),
          ),
        )),
        Expanded(
          child: Center(
            child: Text(
              batter.sixes.toString(),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              batter.getStrikRate(),
              maxLines: 1,
            ),
          ),
        ),
      ],
    );
  }
}
