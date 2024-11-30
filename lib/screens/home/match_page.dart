import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';
import 'package:go_router/go_router.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Matches List or Empty State
        StreamBuilder<List<Match>>(
          stream: context.read<MatchService>().getAllMatches(),
          builder: (BuildContext context, AsyncSnapshot<List<Match>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(child: Text('Connection State None'));
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  final matches = snapshot.data!;
                  if (matches.isEmpty) {
                    return Center(child: Text('No Matches Available'));
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: 60), // Adjust for button height
                      itemCount: matches.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () =>
                              context.push('/matchcenter/${matches[index].id}'),
                          title: Text('Match'),
                          subtitle: Text(matches[index].venue),
                        );
                      },
                    );
                  }
                case ConnectionState.done:
                  return Center(child: Text('Done'));
              }
            }
          },
        ),
        // Fixed Button
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: FilledButton(
            onPressed: () {
              context.pushNamed('newMatch');
            },
            child: Text('Start Match'),
          ),
        ),
      ],
    );
  }
}
