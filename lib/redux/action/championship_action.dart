
import '../model/ChampionshipChart.dart';
import '../model/MatchList.dart';
import '../model/championship.dart';

class GetChampionshipAction{
  const GetChampionshipAction();
}

class GetChampionshipActionSuccess {
  const GetChampionshipActionSuccess({ required this.championshipList});
  final ChampionshipList championshipList;
}


class GetChampionshipActionFailure {
  const GetChampionshipActionFailure({ required this.loginInfo});
  final Championship loginInfo;
}

class GetChampionshipChartAction{
    const GetChampionshipChartAction();
}

class GetChampionshipChartActionSuccess {
  const GetChampionshipChartActionSuccess({ required this.championshipChart});
  final ChampionshipChartList championshipChart;
}

// class GetChampionshipChartActionFailure {
//   const GetChampionshipActionFailure({ required this.loginInfo});
//   final Championship loginInfo;
// }

class GetChampionshipMatchListAction{
  const GetChampionshipMatchListAction({required this.championshipId,required this.seasonId});
  final int championshipId;
  final int seasonId;
}

class GetChampionshipMatchListActionSucces{
   const GetChampionshipMatchListActionSucces({required this.matchList});
  final MatchList matchList;
}

class SelectChampionshipAction {
  const SelectChampionshipAction({ required this.selectedChampionship, required this.onSuccess});
  final Championship selectedChampionship;
     final Function onSuccess;
}

class ChangeMatchDAy{
  const ChangeMatchDAy({required this.matchday});
  final int matchday;
}



