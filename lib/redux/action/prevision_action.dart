import 'package:flutter_redux_project/redux/model/prevision.dart';

import '../model/championship.dart';

class GetPrevisionAction{
  const GetPrevisionAction();
}

class GetPrevisionActionSuccess {
  const GetPrevisionActionSuccess({ required this.previsionList});
  final PrevisionList previsionList;
}


class GetPrevisionActionFailure {
  const GetPrevisionActionFailure({ required this.loginInfo});
  final Championship loginInfo;
}

class AddPrevisionToCart{
    AddPrevisionToCart({ required this.prevision, required this.choice });
  final Prevision prevision;
  final String choice;
}

class DeletePrevisionAction{
  DeletePrevisionAction({required this.championshipId,
      required this.seasonId,
      required this.matchday,
       required this.onSuccess});
  final int championshipId;
  final int seasonId;
  final int matchday;
    final Function onSuccess;
}

class DeletePrevisionActionSuccess{
  DeletePrevisionActionSuccess();
 
}