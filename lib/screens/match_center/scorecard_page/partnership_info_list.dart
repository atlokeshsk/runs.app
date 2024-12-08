import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:runs/main.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/partnership_info_section.dart';

class PartnerShipInfoList extends StatelessWidget {
  const PartnerShipInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    final scale = context.read<ScalingProvider>().scaleFactor;
    final match = context.read<Match>();
    final partnerships =
        match.partnerships.filter().sortByPartnershipOrderDesc().findAllSync();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Partnership',
          style: TextStyle(
            fontSize: 17 * scale,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        SizedBox(height: 10 * scale),
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final partnership = partnerships.elementAt(index);
            final partnershipInfo = partnership.partnershipInfos
                .filter()
                .sortByDatetimeDesc()
                .findFirstSync()!;
            final player1 = partnership.playersInPartnership.elementAt(0);
            final player2 = partnership.playersInPartnership.elementAt(1);
            return PartnershipSectionRow(
              partnershipInfo: partnershipInfo,
              player1: player1,
              player2: player2,
              match: match,
              partnership: partnership,
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: partnerships.length,
        )
      ],
    );
  }
}

class PartnershipSectionRow extends StatelessWidget {
  const PartnershipSectionRow(
      {super.key,
      required this.partnershipInfo,
      required this.player1,
      required this.player2,
      required this.match,
      required this.partnership});

  final PartnershipInfo partnershipInfo;
  final Player player1;
  final Player player2;
  final Match match;
  final Partnership partnership;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(player1.name),
            PartnershipBatterWidget(
              player: player1,
              partnership: partnership,
              match: match,
            ),
          ],
        ),
        PartnershipInfoWidget(
          match: match,
          partnership: partnership,
        ),
        Column(
          children: [
            Text(player2.name),
            PartnershipBatterWidget(
              player: player2,
              partnership: partnership,
              match: match,
            ),
          ],
        ),
      ],
    );
  }
}
