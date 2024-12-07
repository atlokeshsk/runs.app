import 'package:flutter/material.dart';
import 'package:runs/screens/match_center/score_page/score_page.dart';
import 'package:runs/screens/match_center/scorecard_page/scorecard_page.dart';

import 'ball_page/ball_page.dart';

class MatchCenterScreen extends StatelessWidget {
  const MatchCenterScreen({
    super.key,
    required this.matchId,
  });

  final int matchId;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Match Center'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Score'),
              Tab(text: 'Scorecard'),
              Tab(text: 'Balls'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ScorePage(matchId: matchId),
            ScoreCardPage(matchId: matchId),
            BallsPage(),
          ],
        ),
      ),
    );
  }
}
