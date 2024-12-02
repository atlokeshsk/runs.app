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
  final partnershipService = PartnershipService(isarService.isar);
  final partnershInfoService = PartnershipInfoService(isarService.isar);
  final partnershipBatterInfoService =
      PartnershipBatterInfoService(isarService.isar);

  matchService.scoreService = scoreService;

  scoreService.scoreboardService = scoreboardServie;
  scoreService.batterService = batterService;
  scoreService.ballService = ballService;
  scoreService.partnershipService = partnershipService;
  scoreService.partnershipBatterInfoService = partnershipBatterInfoService;
  scoreService.partnershipInfoService = partnershInfoService;

  runApp(
    MultiProvider(
      providers: [
        Provider.value(
          value: isarService,
        ),
        Provider<BallService>.value(value: ballService),
        Provider<BatterService>.value(value: batterService),
        Provider<MatchService>.value(value: matchService),
        Provider<PlayerService>.value(value: playerService),
        Provider<ScoreService>.value(value: scoreService),
        Provider<TeamService>.value(value: teamService),
        Provider<ScoreboardService>.value(value: scoreboardServie),
        Provider<PartnershipService>.value(value: partnershipService),
        Provider<PartnershipInfoService>.value(value: partnershInfoService),
        Provider<PartnershipBatterInfoService>.value(
            value: partnershipBatterInfoService)
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
