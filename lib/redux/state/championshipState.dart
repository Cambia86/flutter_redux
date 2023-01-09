import 'package:flutter_redux_project/redux/model/MatchList.dart';
import 'package:flutter_redux_project/redux/model/championship.dart';

class ChampionshipState {
  List<Championship>? championshipList;
  MatchList? matchList;
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
