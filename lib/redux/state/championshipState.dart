import 'package:flutter_redux_project/redux/model/championship.dart';

class ChampionshipState {
  List<Championship>? championshipList;
  List<Match>? matchList;
  Championship? currentChampionship;
  int seasonId=2022;

  ChampionshipState({required this.championshipList});

  factory ChampionshipState.initial() {
    return ChampionshipState(championshipList: null);
  }

  ChampionshipState.fromChampionshipStateState(ChampionshipState state) {
    championshipList = state.championshipList;
  }
}
