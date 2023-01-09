import 'package:flutter_redux_project/redux/action/championship_action.dart';
import 'package:flutter_redux_project/redux/model/MatchList.dart';
import 'package:flutter_redux_project/redux/state/championshipState.dart';

ChampionshipState championshipReducer(
    ChampionshipState prevState, dynamic action) {
  ChampionshipState newState =
      ChampionshipState.fromChampionshipStateState(prevState);
  if (action is GetChampionshipAction) {
    // newState.isLoading = true;
  }

  if (action is GetChampionshipActionSuccess) {
    newState.championshipList = action.championshipList.lstChampionship;
    // newState.isLoading = false;
  }
  if (action is GetChampionshipActionFailure) {
    // newState.isLoading = false;
    // newState.errorCode=action.loginInfo.errorCode!=null?action.loginInfo.errorCode!:"";
    // newState.errorMessage=action.loginInfo.errorMessage!=null?action.loginInfo.errorMessage!:"";
  }
  if (action is SelectChampionshipAction) {
    newState.currentChampionship = action.selectedChampionship;
  }
  if (action is GetChampionshipMatchListAction) {
    //newState.matchList=action.matchList;
  }
  if (action is GetChampionshipMatchListActionSucces) {
    newState.matchList = action.matchList;
    if (newState.currentChampionship != null) {
      int currmatchday =
          newState.currentChampionship!.currentSeason.currentMatchday;
      newState.currentMatchDayList = action.matchList.lstMatch
          .where((d) => d.matchday == currmatchday)
          .toList()
          .cast<MatchItem>();
    }
  }
  if (action is ChangeMatchDAy) {
    newState.currentChampionship!.currentSeason.currentMatchday =
        action.matchday;
    newState.currentMatchDayList = newState.matchList!.lstMatch
        .where((d) => d.matchday == action.matchday)
        .toList()
        .cast<MatchItem>();
  }
  return newState;
}
