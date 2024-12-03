import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runs/main.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class BattersInfo extends StatelessWidget {
  const BattersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    // Adjust multiplier as needed
    final headerStyle = TextStyle(
      fontWeight: FontWeight.bold,
    );
    final scale = context.read<ScalingProvider>().scaleFactor;

    // players on crease
    final player1 = score.playersOnCrease.elementAtOrNull(0);
    final player2 = score.playersOnCrease.elementAtOrNull(1);

    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 10.0 * scale, horizontal: 20 * scale),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => context.push('/selectbatsman', extra: score),
                  child: Icon(
                    Icons.edit,
                    color: Colors.orange,
                    size: 17,
                  ),
                ),
              ),
              Expanded(flex: 3, child: Text('Batsman', style: headerStyle)),
              Expanded(child: Center(child: Text('R', style: headerStyle))),
              Expanded(child: Center(child: Text('B', style: headerStyle))),
              Expanded(child: Center(child: Text('0s', style: headerStyle))),
              Expanded(child: Center(child: Text('4s', style: headerStyle))),
              Expanded(child: Center(child: Text('6s', style: headerStyle))),
            ],
          ),
          SizedBox(height: 10 * scale),
          (player1 == null)
              ? BatterEmptyRow()
              : BatterRow(
                  player: player1,
                  isStriker: player1.id == score.striker.value?.id,
                ),
          SizedBox(height: 3 * scale),
          (player2 == null)
              ? BatterEmptyRow()
              : BatterRow(
                  player: player2,
                  isStriker: player2.id == score.striker.value?.id,
                ),
        ],
      ),
    );
  }
}

class BatterEmptyRow extends StatelessWidget {
  const BatterEmptyRow({super.key});

  @override
  Widget build(BuildContext context) {
    final fontSize = MediaQuery.of(context).size.width * 0.035;
    final headerStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize);
    return Row(
      children: [
        Expanded(flex: 3, child: Text('-', style: headerStyle)),
        Expanded(child: Center(child: Text('-', style: headerStyle))),
        Expanded(child: Center(child: Text('-', style: headerStyle))),
        Expanded(child: Center(child: Text('-', style: headerStyle))),
        Expanded(child: Center(child: Text('-', style: headerStyle))),
        Expanded(child: Center(child: Text('-', style: headerStyle))),
      ],
    );
  }
}

class BatterRow extends StatelessWidget {
  final Player player;
  final bool isStriker;

  const BatterRow({super.key, required this.player, required this.isStriker});

  @override
  Widget build(BuildContext context) {
    final scoreService = context.read<ScoreService>();
    final score = context.read<Score>();

    final textStyle =
        TextStyle(fontWeight: FontWeight.w500); // Clear font weight
    final backgroundColor =
        isStriker ? Colors.orange.shade500 : Colors.transparent;
    final scale = context.read<ScalingProvider>().scaleFactor;

    return FutureBuilder<Batter?>(
      future: context
          .read<BatterService>()
          .entryExists(playerId: player.id, matchId: score.match.value!.id),
      builder: (context, snapshot) {
        final batter = snapshot.data;
        return GestureDetector(
          onTap: () async {
            scoreService.updateStriker(
                score: context.read<Score>(), player: player);
          },
          child: Container(
            // Only background color changes for the striker
            padding: EdgeInsets.symmetric(
                vertical: 6.0 * scale, horizontal: 8.0 * scale),
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(6.0 * scale)),
            // Compact padding
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    player.name + (isStriker ? '*' : ''),
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  child: Center(
                    child: Text(
                      batter?.runs.toString() ?? '0',
                      style: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      batter?.balls.toString() ?? '0',
                      style: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      batter?.dots.toString() ?? '0',
                      style: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      batter?.fours.toString() ?? '0',
                      style: textStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      batter?.sixes.toString() ?? '0',
                      style: textStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
