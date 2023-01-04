import 'package:flutter_redux_project/redux/model/championship.dart';

class ChampionshipState {
  List<Championship>? championshipList;

  ChampionshipState({required this.championshipList});

  factory ChampionshipState.initial() {
    return ChampionshipState(championshipList: null);
  }

  ChampionshipState.fromChampionshipStateState(ChampionshipState state) {
    championshipList:
    state.championshipList;
  }
}
