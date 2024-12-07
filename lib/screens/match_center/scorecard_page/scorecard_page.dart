import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/main.dart';
import 'package:runs/screens/match_center/score_page/partnership_info_section.dart';
import 'package:runs/screens/match_center/scorecard_page/fall_of_wickets_info.dart';
import 'package:runs/screens/match_center/scorecard_page/partnership_info_list.dart';
import 'package:runs/screens/match_center/scorecard_page/scoreboard_info.dart';
import 'package:runs/services/score_service.dart';

class ScoreCardPage extends StatelessWidget {
  const ScoreCardPage({super.key, required this.matchId});
  final int matchId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<ScoreService>().getLatestScore(matchId: matchId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.done:
              return SizedBox.shrink();
            case ConnectionState.active:
              final score = snapshot.data![0];
              final match = score.match.value!;
              if (match.score.length == 1) {
                return Center(
                  child: Text('No Balls Bowled'),
                );
              }
              final scale = context.read<ScalingProvider>().scaleFactor;
              return MultiProvider(
                providers: [
                  Provider.value(value: match),
                  Provider.value(value: score)
                ],
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.0 * scale, horizontal: 20 * scale),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ScoreboardInfo(),
                        Divider(),
                        FallOfWicketsInfo(),
                        SizedBox(height: 30 * scale),
                        PartnerShipInfoList()
                      ],
                    ),
                  ),
                ),
              );
          }
        }
      },
    );
  }
}
