import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/main.dart';
import 'package:runs/models/models.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({super.key});

  final double baseHeight = 932.0;

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    final match = score.match.value!;
    final scale = context.read<ScalingProvider>().scaleFactor;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0 * scale),
      child: Column(
        children: [
          Text(
            match.opponentName.toUpperCase(),
          ),
          match.innings == Innings.first
              ? Text('1st Innings')
              : Text('2nd Innings'),
          SizedBox(height: 10 * scale),
          Text(
            '${score.runs}-${score.wicketsFall}',
            style: TextStyle(
              color: Colors.green,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
