import 'package:flutter/material.dart';

enum Control {
  mainMenu,
  lebbye,
  bye,
  wide,
  noball,
  noballLegbye,
  noballBye,
  selectBatsman,
  selectStriker,
  out,
  endInnings
}

enum Modifier {
  legBye,
  bye,
  wide,
  noball,
  noballLegbye,
  noballBye,
  out,
}

class ControlSectionState extends ChangeNotifier {
  ControlSectionState({required this.state});

  Control state;

  void changeSection(Control state) {
    this.state = state;
    notifyListeners();
  }
}
