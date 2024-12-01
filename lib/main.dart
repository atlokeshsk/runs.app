import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/router.dart';
import 'package:runs/services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isarService = IsarService();
  await isarService.initialize();
  final ballService = BallService(isarService.isar);
  final batterService = BatterService(isarService.isar);
  final matchService = MatchService(isarService.isar);
  final playerService = PlayerService(isarService.isar);
  final scoreService = ScoreService(isarService.isar);
  final teamService = TeamService(isarService.isar);
  final scoreboardServie = ScoreboardService(isarService.isar);

  matchService.scoreService = scoreService;

  scoreService.scoreboardService = scoreboardServie;
  scoreService.batterService = batterService;

  runApp(
    MultiProvider(
      providers: [
        Provider.value(
          value: isarService,
        ),
        Provider<BallService>.value(
          value: ballService,
        ),
        Provider<BatterService>.value(
          value: batterService,
        ),
        Provider<MatchService>.value(
          value: matchService,
        ),
        Provider<PlayerService>.value(
          value: playerService,
        ),
        Provider<ScoreService>.value(
          value: scoreService,
        ),
        Provider<TeamService>.value(
          value: teamService,
        ),
        Provider.value(value: scoreboardServie),
      ],
      child: RunsApp(),
    ),
  );
}

class RunsApp extends StatelessWidget {
  const RunsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData.light(),
    );
  }
}
