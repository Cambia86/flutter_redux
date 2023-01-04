
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


