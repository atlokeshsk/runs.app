import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';

class MainInfo extends StatelessWidget {
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    final match = score.match.value!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Text(
            match.opponentName.toUpperCase(),
          ),
          match.innings == Innings.first
              ? Text('1st Innings')
              : Text('2nd Innings'),
          SizedBox(height: 10),
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
