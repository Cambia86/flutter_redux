import '../model/prevision.dart';

class MatchPrevisionState {
  PrevisionList? previsionList;
  bool isLoading=false;
  // MatchList? matchList;
  // List<MatchItem>? currentMatchDayList;
  // Championship? currentChampionship;
  int seasonId=2022;

  MatchPrevisionState({required this.previsionList});

  factory MatchPrevisionState.initial() {
    return MatchPrevisionState(previsionList: null);
  }

  MatchPrevisionState.fromPrevisionState(MatchPrevisionState state) {
    previsionList = state.previsionList;
   
  }
}
