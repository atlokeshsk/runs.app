import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/main.dart';
import 'package:runs/models/models.dart';

class FallOfWicketsInfo extends StatelessWidget {
  const FallOfWicketsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final match = context.read<Match>();
    final fallOfWickets = match.fallOfWickets;
    if (fallOfWickets.isEmpty) {
      return SizedBox.shrink();
    }
    final scale = context.read<ScalingProvider>().scaleFactor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: scale * 30),
        Text(
          'Fall Of Wickets',
          style: TextStyle(
            fontSize: 17 * scale,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 7 * scale),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.all(0),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final wicket = fallOfWickets.elementAt(index);
            final player = wicket.player.value!;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${index + 1}'),
                SizedBox(width: 20 * scale),
                Expanded(child: Text(player.name)),
                Text('${wicket.run}(${wicket.over}.${wicket.ball})')
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: fallOfWickets.length,
        ),
      ],
    );
  }
}
