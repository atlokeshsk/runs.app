import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:runs/models/models.dart';
import 'package:runs/services/services.dart';

class NewMatchScreen extends StatefulWidget {
  const NewMatchScreen({super.key});

  @override
  State<NewMatchScreen> createState() => _NewMatchScreenState();
}

class _NewMatchScreenState extends State<NewMatchScreen> {
  Innings _innings = Innings.first;
  Team? _team;
  bool _lastManStanding = false;
  final _formKey = GlobalKey<FormState>();
  final _opponentNameController = TextEditingController();
  final _venueController = TextEditingController();
  final _oversController = TextEditingController();
  final _playersController = TextEditingController();
  final _targetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Runs.App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                width: double.infinity,
                child: SegmentedButton<Innings>(
                  selected: <Innings>{_innings},
                  onSelectionChanged: (value) {
                    setState(() {
                      _innings = value.first;
                    });
                  },
                  segments: [
                    ButtonSegment(
                      value: Innings.first,
                      label: Text('setting'),
                    ),
                    ButtonSegment(
                      value: Innings.second,
                      label: Text('chasing'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  final team = await context.pushNamed<Team>('selectTeam');
                  setState(() {
                    _team = team;
                  });
                },
                child: CircleAvatar(
                  radius: 50,
                  child: _team != null
                      ? Text(
                          _team != null && _team!.name.isNotEmpty
                              ? (_team!.name.length > 1
                                  ? _team!.name[0].toUpperCase() +
                                      _team!.name[1].toUpperCase()
                                  : _team!.name[0]
                                      .toUpperCase()) // Handle single character names
                              : "??", // Fallback for null or empty names
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ))
                      : Icon(
                          Icons.groups_3,
                          size: 50,
                        ),
                ),
              ),
              if (_team == null) Center(child: Text('Add Team')),
              SizedBox(height: 10),
              TextFormField(
                controller: _opponentNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'opponent name',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _venueController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'required';
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'venue',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _oversController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  final overs = int.tryParse(value);
                  if (overs == null || overs <= 0) {
                    return 'Overs must be greater than zero';
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'overs',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              if (_innings == Innings.second) SizedBox(height: 10),
              if (_innings == Innings.second)
                TextFormField(
                  controller: _targetController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    final target = int.tryParse(value);
                    if (target == null || target <= 0) {
                      return 'Target must be greater than zero';
                    }
                    return null;
                  },
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'target',
                    filled: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              SizedBox(height: 10),
              TextFormField(
                controller: _playersController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Required';
                  }
                  final players = int.tryParse(value);
                  if (players == null || players < 2) {
                    return 'Must be at least 2 players';
                  }
                  return null;
                },
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'No Players',
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Last Man Standing',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                    value: _lastManStanding,
                    onChanged: (value) {
                      setState(
                        () {
                          _lastManStanding = value;
                        },
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () async {
                    // check team is added.
                    if (_team == null) {
                      // Inform the user to add a team
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please add a team before starting the match'),
                          backgroundColor: Colors
                              .red, // Optional: Highlight the message in red
                        ),
                      );
                      return; // Exit early since validation failed
                    }
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Processing Data',
                          ),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                    final matchService = context.read<MatchService>();
                    final matchId = await matchService.createNewMatch(
                      innings: _innings,
                      opponentName: _opponentNameController.text,
                      venue: _venueController.text,
                      overs: int.parse(_oversController.text),
                      playersCount: int.parse(_playersController.text),
                      lastManStanding: _lastManStanding,
                      team: _team!,
                      target: int.tryParse(_targetController.text),
                    );
                    context.pushReplacement('/matchcenter/$matchId');
                  },
                  child: Text(
                    'Start Match',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
