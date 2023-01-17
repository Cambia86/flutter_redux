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