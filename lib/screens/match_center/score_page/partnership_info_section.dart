import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';

import 'package:runs/services/services.dart';

class PartnershipSection extends StatelessWidget {
  const PartnershipSection({
    super.key,
    required this.match,
    required this.score,
  });

  final Match match;
  final Score score;

  @override
  Widget build(BuildContext context) {
    final partnershipService = context.read<PartnershipService>();
    return FutureBuilder(
      future: partnershipService.entryExists(
          players: score.playersOnCrease.toList(), matchId: match.id),
      builder: (BuildContext context, AsyncSnapshot<Partnership?> snapshot) {
        final partnership = snapshot.data;
        if (score.playersOnCrease.length == 2) {
          return Column(
            children: [
              Text('Partnership'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(score.playersOnCrease.elementAt(0).name),
                        partnership == null
                            ? Text('0(0)')
                            : PartnershipBatterWidget(
                                player: score.playersOnCrease.elementAt(0),
                                partnership: partnership,
                                match: match,
                              )
                      ],
                    ),
                  ),
                  PartnershipInfoWidget(
                    match: match,
                    partnership: partnership,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(score.playersOnCrease.elementAt(1).name),
                        partnership == null
                            ? Text('0(0)')
                            : PartnershipBatterWidget(
                                player: score.playersOnCrease.elementAt(1),
                                partnership: partnership,
                                match: match,
                              )
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(indent: 10, endIndent: 10),
            ],
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}

class PartnershipBatterWidget extends StatelessWidget {
  const PartnershipBatterWidget({
    super.key,
    required this.player,
    required this.partnership,
    required this.match,
  });

  final Player player;
  final Partnership partnership;
  final Match match;

  @override
  Widget build(BuildContext context) {
    final partnershipBatterInfoService =
        context.read<PartnershipBatterInfoService>();
    return FutureBuilder(
      future: partnershipBatterInfoService.getBatter(
          player: player, partnership: partnership, match: match),
      builder: (BuildContext context,
          AsyncSnapshot<PartnershipBatterInfo?> snapshot) {
        final batter = snapshot.data;
        return batter == null
            ? Text('0(0)')
            : Text('${batter.runs}(${batter.balls})');
      },
    );
  }
}

class PartnershipInfoWidget extends StatelessWidget {
  const PartnershipInfoWidget(
      {super.key, required this.match, required this.partnership});

  final Match match;
  final Partnership? partnership;

  @override
  Widget build(BuildContext context) {
    final partnershipInfoService = context.read<PartnershipInfoService>();
    if (partnership == null) {
      return Text('0(0)');
    }
    return FutureBuilder(
      future: partnershipInfoService.getPartnership(
          partnership: partnership!, match: match),
      builder:
          (BuildContext context, AsyncSnapshot<PartnershipInfo?> snapshot) {
        final data = snapshot.data;
        return data == null
            ? Text('0(0)')
            : Text('${data.runs}(${data.balls})');
      },
    );
  }
}
