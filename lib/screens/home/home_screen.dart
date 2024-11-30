import 'package:flutter/material.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final pages = [
    MatchPage(),
    TeamPage(),
    PlayerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Runs.App'),
      ), 
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (index) {
          setState(() {
            _index = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.sports_cricket),
            label: 'Matches',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_3),
            label: 'Teams',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Teams',
          ),
        ],
      ),
    );
  }
}
