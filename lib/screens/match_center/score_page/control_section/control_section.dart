import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/router.dart';
import 'package:runs/screens/home/match_page.dart';
import 'package:runs/services/services.dart';

import 'control_section_provider.dart';

class ControlSection extends StatelessWidget {
  const ControlSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.orange.shade500,
      width: double.infinity,
      height: screenHeight * 0.20,
      child: Builder(
        builder: (context) {
          var score = context.watch<Score>();
          var controlState = context.watch<ControlSectionState>();

          switch (controlState.state) {
            case Control.mainMenu:
              return MainButtonSection();
            case Control.lebbye:
              return LegbyeScreen();
            case Control.bye:
              return ByeScreen();
            case Control.wide:
              return WideScreen();
            case Control.noball:
              return NoballScreen();
            case Control.noballLegbye:
              return NoballLegbyeScreen();
            case Control.noballBye:
              return NoballByeScreen();
            case Control.selectBatsman:
              return SelectBatsman();
            case Control.selectStriker:
              return SelectStriker();
          }
        },
      ),
    );
  }
}

class MainButtonSection extends StatelessWidget {
  const MainButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
        children: [
          RunsButton(runs: 1, label: '1'),
          RunsButton(runs: 2, label: '2'),
          RunsButton(runs: 3, label: '3'),
          RunsButton(runs: 4, label: '4'),
          RunsButton(runs: 6, label: '6'),
          RunsButton(runs: 0, label: '0'),
          ModifierButtons(
            label: 'LB',
            modifier: Modifier.legBye,
          ),
          ModifierButtons(
            label: 'Bye',
            modifier: Modifier.bye,
          ),
          ModifierButtons(
            label: 'Wide',
            modifier: Modifier.wide,
          ),
          ModifierButtons(label: 'NB', modifier: Modifier.noball),
          RunsButton(runs: 12345, label: '1234')
        ],
      ),
    );
  }
}

class RunsButton extends StatelessWidget {
  const RunsButton({
    super.key,
    required this.runs,
    required this.label,
    this.legbye = false,
    this.bye = false,
    this.wide = false,
    this.noball = false,
  });

  final int runs;
  final String label;
  final bool legbye;
  final bool bye;
  final bool wide;
  final bool noball;

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    final scoreService = context.read<ScoreService>();
    final scoreboardService = context.read<ScoreboardService>();
    final batterService = context.read<BatterService>();
    return TextButton(
      onPressed: () async {
        if (score.oversCompleted == 0 && score.playersOnCrease.isEmpty) {
          context
              .read<ControlSectionState>()
              .changeSection(Control.selectBatsman);
          return;
        }
        if (score.playersOnCrease.length == 2 && score.striker.value == null) {
          context
              .read<ControlSectionState>()
              .changeSection(Control.selectStriker);
          return;
        }
        await scoreService.addRuns(
          runs: runs,
          label: label,
          legbye: legbye,
          bye: bye,
          wide: wide,
          noball: noball,
          score: score,
          scoreboardService: scoreboardService,
          batterService: batterService,
        );
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ModifierButtons extends StatelessWidget {
  const ModifierButtons({
    super.key,
    required this.label,
    required this.modifier,
  });

  final String label;
  final Modifier modifier;

  @override
  Widget build(BuildContext context) {
    var controlState = context.read<ControlSectionState>();
    return TextButton(
      onPressed: () {
        switch (modifier) {
          case Modifier.legBye:
            controlState.changeSection(Control.lebbye);
          case Modifier.bye:
            controlState.changeSection(Control.bye);
          case Modifier.wide:
            controlState.changeSection(Control.wide);
          case Modifier.noball:
            controlState.changeSection(Control.noball);
          case Modifier.noballLegbye:
            controlState.changeSection(Control.noballLegbye);
          case Modifier.noballBye:
            controlState.changeSection(Control.noballBye);
        }
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class LegbyeScreen extends StatelessWidget {
  const LegbyeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            context.read<ControlSectionState>().changeSection(Control.mainMenu);
          },
          child: Text(
            'x Leg Byes',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 1, label: '1 LB', legbye: true),
            RunsButton(runs: 2, label: '2 LB', legbye: true),
            RunsButton(runs: 3, label: '3 LB', legbye: true),
            RunsButton(runs: 4, label: '4 LB', legbye: true),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 5, label: '5 LB', legbye: true),
            RunsButton(runs: 6, label: '6 LB', legbye: true),
            RunsButton(runs: 7, label: '7 LB', legbye: true),
          ],
        ),
      ],
    );
  }
}

class NoballLegbyeScreen extends StatelessWidget {
  const NoballLegbyeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            context.read<ControlSectionState>().changeSection(Control.noball);
          },
          child: Text(
            'x No Ball (Leg Byes)',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 1, label: '1 LB NB', legbye: true, noball: true),
            RunsButton(runs: 2, label: '2 LB NB', legbye: true, noball: true),
            RunsButton(runs: 3, label: '3 LB NB', legbye: true, noball: true),
            RunsButton(runs: 4, label: '4 LB NB', legbye: true, noball: true),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 5, label: '5 LB NB', legbye: true, noball: true),
            RunsButton(runs: 6, label: '6 LB NB', legbye: true, noball: true),
            RunsButton(runs: 7, label: '7 LB NB', legbye: true, noball: true),
          ],
        ),
      ],
    );
  }
}

class ByeScreen extends StatelessWidget {
  const ByeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            context.read<ControlSectionState>().changeSection(Control.mainMenu);
          },
          child: Text(
            'x Byes',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 1, label: '1 B', bye: true),
            RunsButton(runs: 2, label: '2 B', bye: true),
            RunsButton(runs: 3, label: '3 B', bye: true),
            RunsButton(runs: 4, label: '4 B', bye: true),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 5, label: '5 B', bye: true),
            RunsButton(runs: 6, label: '6 B', bye: true),
            RunsButton(runs: 7, label: '7 B', bye: true),
          ],
        ),
      ],
    );
  }
}

class NoballByeScreen extends StatelessWidget {
  const NoballByeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            context.read<ControlSectionState>().changeSection(Control.noball);
          },
          child: Text(
            'x Noball (Byes)',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 1, label: '1B NB', bye: true, noball: true),
            RunsButton(runs: 2, label: '2B NB', bye: true, noball: true),
            RunsButton(runs: 3, label: '3B NB', bye: true, noball: true),
            RunsButton(runs: 4, label: '4B NB', bye: true, noball: true),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 5, label: '5B NB', bye: true, noball: true),
            RunsButton(runs: 6, label: '6B NB', bye: true, noball: true),
            RunsButton(runs: 7, label: '7B NB', bye: true, noball: true),
          ],
        ),
      ],
    );
  }
}

class WideScreen extends StatelessWidget {
  const WideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            context.read<ControlSectionState>().changeSection(Control.mainMenu);
          },
          child: Text(
            'x Wide',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 0, label: 'Wd', wide: true),
            RunsButton(runs: 1, label: '1 + Wd', wide: true),
            RunsButton(runs: 2, label: '2 + Wd', wide: true),
            RunsButton(runs: 3, label: '3 + Wd', wide: true),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: 4, label: '4 + Wd', wide: true),
            RunsButton(runs: 5, label: '5 + Wd', wide: true),
            RunsButton(runs: 6, label: '6 + Wd', wide: true),
          ],
        ),
      ],
    );
  }
}

class NoballScreen extends StatelessWidget {
  const NoballScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            context.read<ControlSectionState>().changeSection(Control.mainMenu);
          },
          child: Text(
            'x No Ball',
            style: TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RunsButton(runs: 0, label: 'NB', noball: true),
              RunsButton(runs: 1, label: '1 NB', noball: true),
              RunsButton(runs: 2, label: '2 NB', noball: true),
              RunsButton(runs: 3, label: '3 NB', noball: true),
              RunsButton(runs: 4, label: '4 NB', noball: true),
              RunsButton(runs: 6, label: '6 NB', noball: true),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ModifierButtons(
              label: 'Leg Byes',
              modifier: Modifier.noballLegbye,
            ),
            ModifierButtons(
              label: 'Byes',
              modifier: Modifier.noballBye,
            )
          ],
        ),
      ],
    );
  }
}

class SelectBatsman extends StatelessWidget {
  const SelectBatsman({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    return Column(
      children: [
        TextButton(
          onPressed: () {
            context.read<ControlSectionState>().changeSection(Control.mainMenu);
          },
          child: Text(
            'x Select Players',
          ),
        ),
        OutlinedButton(
          onPressed: () {
            context.push('/selectbatsman', extra: score);
          },
          child: Text('Select Batsman'),
        ),
      ],
    );
  }
}

class SelectStriker extends StatelessWidget {
  const SelectStriker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    final scoreService = context.read<ScoreService>();
    final textStyle = TextStyle(color: Colors.black);
    return Column(
      children: [
        TextButton(
          onPressed: () {
            context.read<ControlSectionState>().changeSection(Control.mainMenu);
          },
          child: Text(
            'X Select Striker',
            style: textStyle,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () async {
                await scoreService.updateStriker(
                    score: score, player: score.playersOnCrease.elementAt(0));
              },
              child: Text(
                score.playersOnCrease.elementAt(0).name,
                style: textStyle,
              ),
            ),
            OutlinedButton(
              onPressed: () async {
                await scoreService.updateStriker(
                    score: score, player: score.playersOnCrease.elementAt(1));
              },
              child: Text(
                score.playersOnCrease.elementAt(1).name,
                style: textStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
