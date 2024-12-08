import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/main.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class RecentBalls extends StatelessWidget {
  const RecentBalls({super.key, required this.score});

  final Score score;

  @override
  Widget build(BuildContext context) {
    final ballService = context.read<BallService>();
    final ScrollController scrollController = ScrollController();
    final scale = context.read<ScalingProvider>().scaleFactor;

    return Container(
      height: 45 * scale,
      margin: EdgeInsets.symmetric(vertical: 8.0 * scale),
      padding: EdgeInsets.symmetric(horizontal: 12.0 * scale),
      child: FutureBuilder<List<Ball>>(
        future: ballService.getCurrentOverBalls(
          match: score.match.value!,
          over: score.currentOvers,
        ),
        builder: (context, snapshot) {
          final balls = snapshot.data ?? [];
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (scrollController.hasClients) {
              scrollController.jumpTo(
                scrollController.position.maxScrollExtent,
              );
            }
          });

          return ListView.builder(
            controller: scrollController,
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
    final scale = context.read<ScalingProvider>().scaleFactor;

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
        color = Colors.orange.shade400; // Wide
        break;
      case BallType.noball:
      case BallType.noballLegbye:
      case BallType.noballBye:
        color = Colors.deepOrange; // Light blue for no-ball
        break;
      case BallType.wicket:
        color = Colors.red; // Red for dismissal
        break;
      case BallType.bye:
      case BallType.legbye:
        color = Colors.orange.shade300;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.0 * scale),
      child: CircleAvatar(
        radius: 18, // Slightly larger for better visibility
        backgroundColor: color,
        foregroundColor: Colors.white,
        child: FittedBox(
          child: Text(
            ball.name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
