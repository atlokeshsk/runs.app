import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class RecentBalls extends StatelessWidget {
  const RecentBalls({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    final ballService = context.read<BallService>();
    final ScrollController _scrollController = ScrollController();
    final height = MediaQuery.of(context).size.height * 0.06;

    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: FutureBuilder<List<Ball>>(
        future: ballService.getCurrentOverBalls(
          match: score.match.value!,
          over: score.currentOvers,
        ),
        builder: (context, snapshot) {
          final balls = snapshot.data ?? [];
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.jumpTo(
                _scrollController.position.maxScrollExtent,
              );
            }
          });

          return ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: balls.length,
            itemBuilder: (context, index) {
              return BallAvatar(ball: balls[index]);
            },
          );
        },
      ),
    );
  }
}

class BallAvatar extends StatelessWidget {
  const BallAvatar({super.key, required this.ball});

  final Ball ball;

  @override
  Widget build(BuildContext context) {
    final Color color;

    // Assign colors based on ball type
    switch (ball.ballType) {
      case BallType.runs:
        color = Colors.orange.shade500; // Neutral grey
        break;
      case BallType.four:
      case BallType.six:
        color = Colors.blueAccent; // Positive highlight for six
        break;
      case BallType.wide:
        color = Colors.grey.shade400; // Wide
        break;
      case BallType.noball:
      case BallType.noballLegbye:
      case BallType.noballBye:
        color = Colors.deepOrange; // Light blue for no-ball
        break;
      case BallType.wicket:
        color = Colors.red; // Red for dismissal
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: CircleAvatar(
        radius: 18, // Slightly larger for better visibility
        backgroundColor: color,
        foregroundColor: Colors.white,
        child: Text(
          ball.name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
