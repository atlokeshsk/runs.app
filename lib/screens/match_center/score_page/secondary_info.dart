import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/helper/helper.dart';
import 'package:runs/models/models.dart';

class SecondaryInfo extends StatelessWidget {
  const SecondaryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    final match = score.match.value!;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Extras-${score.extras}'),
            Text('Overs-${score.ballsBowed.overs}/${match.overs}'),
            Text('CRR-${score.runs.currentRunRate(score.ballsBowed)}')
          ],
        ),
        if (match.innings == Innings.second) SizedBox(height: 10),
        if (match.innings == Innings.second)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Target-${match.target}'),
              Text(
                'RR-${match.target!.requiredRunRate(
                  currentRuns: score.runs,
                  ballsRemaining: match.overs * 6 - score.ballsBowed,
                )}',
              ),
            ],
          ),
      ],
    );
  }
}
