import 'package:flutter_redux_project/redux/model/login_info.dart';
import 'package:flutter_redux_project/redux/state/authState.dart';
import 'package:flutter_redux_project/redux/state/championshipState.dart';
import 'package:flutter_redux_project/redux/state/matchPrevisionState.dart';

import 'package:http/http.dart';



class AppState {


  final AuthState authState;
  final ChampionshipState championshipState;
  final MatchPrevisionState previsionState;
  AppState( {required this.authState,required this.championshipState,required this.previsionState ,required String baseUrl});

  factory AppState.initial(){
    return AppState(
      // appConfigState: initialState,
      baseUrl:"localhost:4040",
      authState: AuthState.initial(),
      championshipState:ChampionshipState.initial(),
      previsionState:  MatchPrevisionState.initial()

  // AppState.initialState() : _location = "", _time = "00:00";
  );}

 AppState copyWith({
  required String baseUrl,
  required AuthState authState,
  required ChampionshipState championshipState,
  required MatchPrevisionState prevState
 })  {
  return AppState(authState: authState, championshipState: championshipState, previsionState: prevState,baseUrl: baseUrl);
 }

}
