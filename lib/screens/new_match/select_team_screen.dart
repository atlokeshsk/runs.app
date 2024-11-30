import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class SelectTeamScreen extends StatefulWidget {
  const SelectTeamScreen({super.key});

  @override
  State<SelectTeamScreen> createState() => _SelectTeamScreenState();
}

class _SelectTeamScreenState extends State<SelectTeamScreen> {
  final _teamNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _teamNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Team'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: FilledButton(
                onPressed: () async {
                  final team = await showModalBottomSheet<Team>(
                    context: context,
                    builder: (BuildContext context) {
                      String name = "";
                      return SizedBox(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  controller: _teamNameController,
                                ),
                                SizedBox(height: 10),
                                FilledButton(
                                  onPressed: () async {
                                    print("name given to fthe function$name");
                                    final team = await context
                                        .read<TeamService>()
                                        .createNewTeam(
                                            _teamNameController.text);
                                    print(team);
                                    context.pop(team);
                                  },
                                  child: Text('Create Team'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  if (team != null) {
                    context.pop(team);
                  }
                },
                child: Text('Create New Team'),
              ),
            ),
            SizedBox(height: 20),
            StreamBuilder<List<Team>>(
              stream: context.read<TeamService>().getAllTeams(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Team>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return SizedBox.shrink();
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                  case ConnectionState.active:
                    final teams = snapshot.data!;

                    if (teams.isNotEmpty) {
                      return Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Choose From Existing Team',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: teams.length,
                                itemBuilder: (context, index) {
                                  final name = teams[index].name;
                                  return ListTile(
                                    onTap: () {
                                      context.pop<Team>(teams[index]);
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
