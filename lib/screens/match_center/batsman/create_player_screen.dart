import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class CreatePlayerScreen extends StatefulWidget {
  const CreatePlayerScreen({super.key, required this.teamId});

  final int teamId;

  @override
  State<CreatePlayerScreen> createState() => _CreatePlayerScreenState();
}

class _CreatePlayerScreenState extends State<CreatePlayerScreen> {
  final _playerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Player'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: FilledButton(
                onPressed: () async {
                  final player = await showModalBottomSheet<Player>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  controller: _playerNameController,
                                ),
                                SizedBox(height: 10),
                                FilledButton(
                                  onPressed: () async {
                                    final player = await context
                                        .read<PlayerService>()
                                        .createPlayerAndToTeam(
                                            name: _playerNameController.text,
                                            teamId: widget.teamId);

                                    context.pop(player);
                                  },
                                  child: Text('Create Player'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  if (player != null) {
                    context.pop();
                  }
                },
                child: Text('Create New Player'),
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<List<Player>>(
              stream: context.read<PlayerService>().getAllPlayers(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Player>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return SizedBox.shrink();
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                    final players = snapshot.data!;

                    if (players.isNotEmpty) {
                      return Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose From Existing player',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: players.length,
                                itemBuilder: (context, index) {
                                  final player = players[index];
                                  final name = player.name;
                                  return ListTile(
                                    onTap: () async {
                                      await context
                                          .read<PlayerService>()
                                          .addTeamToPlayer(
                                            playerId: player.id,
                                            teamId: widget.teamId,
                                          );
                                      context.pop();
                                    },
                                    leading: CircleAvatar(
                                      radius: 15,
                                      child: Text(
                                        name.length >= 2
                                            ? name[0] + name[1]
                                            : (name.isNotEmpty ? name[0] : '?'),
                                      ),
                                    ),
                                    title: Text(
                                      name,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  case ConnectionState.done:
                    return SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
