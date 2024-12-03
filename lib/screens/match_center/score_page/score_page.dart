import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/control_section/control_section_provider.dart';
import 'package:runs/screens/match_center/score_page/partnership_info_section.dart';
import 'package:runs/screens/match_center/score_page/recent_balls.dart';
import 'package:runs/services/services.dart';

import 'batters_info.dart';
import 'control_section/control_section.dart';
import 'main_info.dart';
import 'secondary_info.dart';

class ScorePage extends StatelessWidget {
  const ScorePage({super.key, required this.matchId});

  final int matchId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ControlSectionState(state: Control.mainMenu),
      child: StreamBuilder<List<Score>>(
        stream: context.read<ScoreService>().getLatestScore(matchId: matchId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return SizedBox.shrink();
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:

                // Use addPostFrameCallback to reset ControlSectionState
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context
                      .read<ControlSectionState>()
                      .changeSection(Control.mainMenu);
                });

                final score = snapshot.data![0];
                final match = score.match.value!;
                return Provider<Score>.value(
                  value: score,
                  child: Column(
                    children: [
                      // Scrollable Content
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              MainInfo(),
                              const Divider(indent: 10, endIndent: 10),
                              SecondaryInfo(),
                              const Divider(indent: 10, endIndent: 10),
                              if (match.innings == Innings.second)
                                Text(
                                  'Need ${match.target! - score.runs} Runs off ${match.overs * 6 - score.ballsBowed}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              if (match.innings == Innings.second)
                                const Divider(indent: 10, endIndent: 10),
                              BattersInfo(),
                              const Divider(indent: 10, endIndent: 10),
                              PartnershipSection(
                                score: score,
                                match: match,
                              ),
                            ],
                          ),
                        ),
                      ),

                      RecentBalls(
                        score: score,
                      ),
                      // Buttons Need to added.
                      ControlSection(),
                    ],
                  ),
                );

              case ConnectionState.done:
                return const Center(child: Text('Done'));
            }
          }
        },
      ),
    );
  }
}
