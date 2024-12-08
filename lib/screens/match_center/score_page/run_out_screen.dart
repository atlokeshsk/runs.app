import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runs/helper/helper.dart';
import 'package:runs/main.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/control_section/control_section.dart';
import 'package:runs/services/score_service.dart';

class RunOutScreen extends StatefulWidget {
  const RunOutScreen({super.key, required this.score});

  final Score score;

  @override
  State<RunOutScreen> createState() => _RunOutScreenState();
}

class _RunOutScreenState extends State<RunOutScreen> {
  late final Score score;
  Player? runoutPlayer;
  Runs runs = Runs.dot;
  RunButtonType runButtonType = RunButtonType.runs;

  Widget playerAvatar(Player player) {
    final scale = context.read<ScalingProvider>().scaleFactor;
    final isSelected = runoutPlayer?.id == player.id;

    return GestureDetector(
      onTap: () {
        setState(() {
          runoutPlayer = player;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5 * scale),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange.shade500 : null,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10 * scale),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: isSelected == false
                  ? Colors.transparent.withOpacity(0.1)
                  : Colors.transparent,
              radius: 25 * scale,
              child: Text(
                player.name.getInitials(),
                style: TextStyle(fontSize: 20 * scale),
              ),
            ),
            SizedBox(height: 10 * scale),
            Text(
              player.name,
              style: TextStyle(fontSize: 16 * scale),
            )
          ],
        ),
      ),
    );
  }

  Widget runsButton(Runs runs, String label) {
    final isSelected = this.runs == runs;
    return InputChip(
      onPressed: () {
        setState(() {
          isSelected ? this.runs = Runs.dot : this.runs = runs;
        });
      },
      label: Text(label),
      backgroundColor: isSelected ? Colors.orange.shade500 : null,
    );
  }

  Widget byeButton() {
    final bool isSelected;
    switch (runButtonType) {
      case RunButtonType.runs:
      case RunButtonType.wide:
      case RunButtonType.noball:
      case RunButtonType.legbyes:
      case RunButtonType.noballLegByes:
        isSelected = false;
      case RunButtonType.noballByes:
      case RunButtonType.byes:
        isSelected = true;
    }

    return InputChip(
      onPressed: () {
        setState(() {
          switch (runButtonType) {
            case RunButtonType.runs:
              runButtonType = RunButtonType.byes;
            case RunButtonType.wide:
              runButtonType = RunButtonType.byes;
            case RunButtonType.noball:
              runButtonType = RunButtonType.noballByes;
            case RunButtonType.legbyes:
              runButtonType = RunButtonType.byes;
            case RunButtonType.noballLegByes:
              runButtonType = RunButtonType.noballByes;
            case RunButtonType.noballByes:
              runButtonType = RunButtonType.noball;
            case RunButtonType.byes:
              runButtonType = RunButtonType.runs;
          }
        });
      },
      backgroundColor: isSelected ? Colors.orange.shade500 : null,
      label: Text('Byes'),
    );
  }

  Widget legbyeButton() {
    final bool isSelected;
    switch (runButtonType) {
      case RunButtonType.runs:
      case RunButtonType.wide:
      case RunButtonType.noball:
      case RunButtonType.byes:
      case RunButtonType.noballByes:
        isSelected = false;
      case RunButtonType.noballLegByes:
      case RunButtonType.legbyes:
        isSelected = true;
    }

    return InputChip(
      onPressed: () {
        setState(() {
          switch (runButtonType) {
            case RunButtonType.runs:
              runButtonType = RunButtonType.legbyes;
            case RunButtonType.wide:
              runButtonType = RunButtonType.legbyes;
            case RunButtonType.noball:
              runButtonType = RunButtonType.noballLegByes;
            case RunButtonType.legbyes:
              runButtonType = RunButtonType.runs;
            case RunButtonType.noballLegByes:
              runButtonType = RunButtonType.noball;
            case RunButtonType.noballByes:
              runButtonType = RunButtonType.noballLegByes;
            case RunButtonType.byes:
              runButtonType = RunButtonType.legbyes;
          }
        });
      },
      backgroundColor: isSelected ? Colors.orange.shade500 : null,
      label: Text('Leg Byes'),
    );
  }

  Widget noballButton() {
    final bool isSelected;
    switch (runButtonType) {
      case RunButtonType.runs:
      case RunButtonType.wide:
      case RunButtonType.legbyes:
      case RunButtonType.byes:
        isSelected = false;
      case RunButtonType.noball:
      case RunButtonType.noballByes:
      case RunButtonType.noballLegByes:
        isSelected = true;
    }

    return InputChip(
      onPressed: () {
        setState(() {
          switch (runButtonType) {
            case RunButtonType.runs:
              runButtonType = RunButtonType.noball;
            case RunButtonType.wide:
              runButtonType = RunButtonType.noball;
            case RunButtonType.noball:
              runButtonType = RunButtonType.runs;
            case RunButtonType.legbyes:
              runButtonType = RunButtonType.noballLegByes;
            case RunButtonType.noballLegByes:
              runButtonType = RunButtonType.legbyes;
            case RunButtonType.noballByes:
              runButtonType = RunButtonType.byes;
            case RunButtonType.byes:
              runButtonType = RunButtonType.noballByes;
          }
        });
      },
      backgroundColor: isSelected ? Colors.orange.shade500 : null,
      label: Text('Noball'),
    );
  }

  Widget wideButton() {
    final bool isSelected;
    switch (runButtonType) {
      case RunButtonType.runs:
      case RunButtonType.legbyes:
      case RunButtonType.byes:
      case RunButtonType.noball:
      case RunButtonType.noballByes:
      case RunButtonType.noballLegByes:
        isSelected = false;
      case RunButtonType.wide:
        isSelected = true;
    }

    return InputChip(
      onPressed: () {
        setState(() {
          switch (runButtonType) {
            case RunButtonType.runs:
              runButtonType = RunButtonType.wide;
            case RunButtonType.wide:
              runButtonType = RunButtonType.runs;
            case RunButtonType.noball:
            case RunButtonType.legbyes:
            case RunButtonType.noballLegByes:
            case RunButtonType.noballByes:
            case RunButtonType.byes:
              runButtonType = RunButtonType.wide;
          }
        });
      },
      backgroundColor: isSelected ? Colors.orange.shade500 : null,
      label: Text('Wide'),
    );
  }

  @override
  void initState() {
    super.initState();
    score = widget.score;
  }

  @override
  Widget build(BuildContext context) {
    final scale = context.read<ScalingProvider>().scaleFactor;
    return Scaffold(
      appBar: AppBar(
        title: Text('Run Out'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10 * scale),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Batter',
                style: TextStyle(fontSize: 18 * scale),
              ),
              SizedBox(height: 10 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (final player in score.playersOnCrease)
                    playerAvatar(player)
                ],
              ),
              SizedBox(height: 20 * scale),
              Text(
                'Batsman Complete any runs? (optional)',
                style: TextStyle(fontSize: 18 * scale),
              ),
              SizedBox(height: 10 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  runsButton(Runs.one, '1'),
                  runsButton(Runs.two, '2'),
                  runsButton(Runs.three, '3'),
                  runsButton(Runs.four, '4'),
                ],
              ),
              SizedBox(height: 10 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  runsButton(Runs.five, '5'),
                  runsButton(Runs.six, '6'),
                  runsButton(Runs.seven, '7'),
                ],
              ),
              Text(
                'Is is this byes or legbyes? (optional)',
                style: TextStyle(fontSize: 18 * scale),
              ),
              SizedBox(height: 10 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  byeButton(),
                  legbyeButton(),
                ],
              ),
              Text(
                'Is this Noball or Wide? (optional)',
                style: TextStyle(fontSize: 18 * scale),
              ),
              SizedBox(height: 10 * scale),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  noballButton(),
                  wideButton(),
                ],
              ),
              SizedBox(height: 10 * scale),
              Center(
                child: FilledButton(
                  onPressed: () async {
                    if (runoutPlayer == null) {
                      // need to disalog box to selec the batsman.
                      return;
                    }
                    await context.read<ScoreService>().runOut(
                        score: score,
                        runoutPlayer: runoutPlayer!,
                        type: runButtonType,
                        runs: runs);
                    context.pop();
                  },
                  child: Text('Done'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
