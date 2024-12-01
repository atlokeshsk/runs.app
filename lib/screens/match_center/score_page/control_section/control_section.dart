import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/router.dart';
import 'package:runs/screens/home/match_page.dart';
import 'package:runs/services/services.dart';

import 'control_section_provider.dart';

enum RunButtonType {
  runs,
  wide,
  byes,
  legbyes,
  noball,
  noballByes,
  noballLegByes,
}

enum Runs {
  dot,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
}

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
        crossAxisSpacing: 7,
        mainAxisSpacing: 10,
        childAspectRatio: 1.5,
        children: [
          RunsButton(runs: Runs.one, label: '1', type: RunButtonType.runs),
          RunsButton(runs: Runs.two, label: '2', type: RunButtonType.runs),
          RunsButton(runs: Runs.three, label: '3', type: RunButtonType.runs),
          RunsButton(runs: Runs.four, label: '4', type: RunButtonType.runs),
          RunsButton(runs: Runs.six, label: '6', type: RunButtonType.runs),
          RunsButton(runs: Runs.dot, label: '0', type: RunButtonType.runs),
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
          UndoButton(),
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
    required this.type,
  });

  final Runs runs;
  final String label;
  final RunButtonType type;

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    final scoreService = context.read<ScoreService>();

    return TextButton(
      onPressed: () async {
        if (score.ballsBowed == 0 && score.playersOnCrease.isEmpty) {
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
        await scoreService.addRuns(runs: runs, score: score, type: type);
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
            RunsButton(
                runs: Runs.one, label: '1 LB', type: RunButtonType.legbyes),
            RunsButton(
                runs: Runs.two, label: '2 LB', type: RunButtonType.legbyes),
            RunsButton(
                runs: Runs.three, label: '3 LB', type: RunButtonType.legbyes),
            RunsButton(
                runs: Runs.four, label: '4 LB', type: RunButtonType.legbyes),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(
                runs: Runs.five, label: '5 LB', type: RunButtonType.legbyes),
            RunsButton(
                runs: Runs.six, label: '6 LB', type: RunButtonType.legbyes),
            RunsButton(
                runs: Runs.seven, label: '7 LB', type: RunButtonType.legbyes),
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
            RunsButton(
                runs: Runs.one,
                label: '1 LB NB',
                type: RunButtonType.noballLegByes),
            RunsButton(
                runs: Runs.two,
                label: '2 LB NB',
                type: RunButtonType.noballLegByes),
            RunsButton(
                runs: Runs.three,
                label: '3 LB NB',
                type: RunButtonType.noballLegByes),
            RunsButton(
                runs: Runs.four,
                label: '4 LB NB',
                type: RunButtonType.noballLegByes),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(
                runs: Runs.five,
                label: '5 LB NB',
                type: RunButtonType.noballLegByes),
            RunsButton(
                runs: Runs.six,
                label: '6 LB NB',
                type: RunButtonType.noballLegByes),
            RunsButton(
                runs: Runs.seven,
                label: '7 LB NB',
                type: RunButtonType.noballLegByes),
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
            RunsButton(runs: Runs.one, label: '1 B', type: RunButtonType.byes),
            RunsButton(runs: Runs.two, label: '2 B', type: RunButtonType.byes),
            RunsButton(
                runs: Runs.three, label: '3 B', type: RunButtonType.byes),
            RunsButton(runs: Runs.four, label: '4 B', type: RunButtonType.byes),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(runs: Runs.five, label: '5 B', type: RunButtonType.byes),
            RunsButton(runs: Runs.six, label: '6 B', type: RunButtonType.byes),
            RunsButton(
                runs: Runs.seven, label: '7 B', type: RunButtonType.byes),
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
            RunsButton(
                runs: Runs.one, label: '1B NB', type: RunButtonType.noballByes),
            RunsButton(
                runs: Runs.two, label: '2B NB', type: RunButtonType.noballByes),
            RunsButton(
                runs: Runs.three,
                label: '3B NB',
                type: RunButtonType.noballByes),
            RunsButton(
                runs: Runs.four,
                label: '4B NB',
                type: RunButtonType.noballByes),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(
                runs: Runs.five,
                label: '5B NB',
                type: RunButtonType.noballByes),
            RunsButton(
                runs: Runs.six, label: '6B NB', type: RunButtonType.noballByes),
            RunsButton(
                runs: Runs.seven,
                label: '7B NB',
                type: RunButtonType.noballByes),
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
            RunsButton(runs: Runs.dot, label: 'Wd', type: RunButtonType.wide),
            RunsButton(
                runs: Runs.one, label: '1 + Wd', type: RunButtonType.wide),
            RunsButton(
                runs: Runs.two, label: '2 + Wd', type: RunButtonType.wide),
            RunsButton(
                runs: Runs.three, label: '3 + Wd', type: RunButtonType.wide),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RunsButton(
                runs: Runs.four, label: '4 + Wd', type: RunButtonType.wide),
            RunsButton(
                runs: Runs.five, label: '5 + Wd', type: RunButtonType.wide),
            RunsButton(
                runs: Runs.six, label: '6 + Wd', type: RunButtonType.wide),
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
              RunsButton(
                  runs: Runs.dot, label: 'NB', type: RunButtonType.noball),
              RunsButton(
                  runs: Runs.one, label: '1 NB', type: RunButtonType.noball),
              RunsButton(
                  runs: Runs.two, label: '2 NB', type: RunButtonType.noball),
              RunsButton(
                  runs: Runs.three, label: '3 NB', type: RunButtonType.noball),
              RunsButton(
                  runs: Runs.four, label: '4 NB', type: RunButtonType.noball),
              RunsButton(
                  runs: Runs.six, label: '6 NB', type: RunButtonType.noball),
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

class UndoButton extends StatelessWidget {
  const UndoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final score = context.read<Score>();
    final match = score.match.value!;
    final scoreService = context.read<ScoreService>();

    return TextButton(
      onPressed: () async {
        if (match.score.length == 1) {
          return;
        }
        await scoreService.undoScore(score: score);
      },
      child: Text(
        'Undo',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
