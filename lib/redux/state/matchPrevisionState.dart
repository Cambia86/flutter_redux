import '../model/prevision.dart';

class Bet {
  Prevision prev;
  String choice;

  Bet({required this.prev, required this.choice});
}

class MatchPrevisionState {
  PrevisionList? previsionList;
  bool isLoading=false;
  List<Bet> betList=[];
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
    betList=state.betList;
   
  }
}
