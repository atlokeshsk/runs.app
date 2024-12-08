import 'package:go_router/go_router.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/batsman/select_batsman_screen.dart';
import 'package:runs/screens/match_center/batsman/create_player_screen.dart';
import 'package:runs/screens/match_center/score_page/run_out_screen.dart';
import 'package:runs/screens/screens.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return HomeScreen();
      },
    ),
    GoRoute(
      name: 'newMatch',
      path: '/newMatch',
      builder: (context, state) {
        return NewMatchScreen();
      },
    ),
    GoRoute(
      name: 'selectTeam',
      path: '/selectTeam',
      builder: (context, state) {
        return SelectTeamScreen();
      },
    ),
    GoRoute(
      name: 'matchcenter',
      path: '/matchcenter/:matchId',
      builder: (context, state) {
        final matchId = state.pathParameters['matchId'];
        return MatchCenterScreen(matchId: int.parse(matchId!));
      },
    ),
    GoRoute(
      name: 'selectbatsman',
      path: '/selectbatsman',
      builder: (context, state) {
        final score = state.extra as Score;

        return SelectBatsmanScreen(score: score);
      },
    ),
    GoRoute(
      name: 'createplayer',
      path: '/createplayer/:teamId',
      builder: (context, state) {
        final teamId = state.pathParameters['teamId'];
        return CreatePlayerScreen(teamId: int.parse(teamId!));
      },
    ),
    GoRoute(
      path: '/runout',
      builder: (context, state) {
        final score = state.extra as Score;

        return RunOutScreen(score: score);
      },
    ),
  ],
);
