import 'package:flutter_redux_project/redux/model/login_info.dart';
import 'package:flutter_redux_project/redux/state/authState.dart';
import 'package:flutter_redux_project/redux/state/championshipState.dart';
import 'package:http/http.dart';

class AppState {


  final AuthState authState;
  final ChampionshipState championshipState;
  AppState( {required this.authState,required this.championshipState, required String baseUrl});

  factory AppState.initial(){
    return AppState(
      // appConfigState: initialState,
      baseUrl:"localhost:4040",
      authState: AuthState.initial(),
      championshipState:ChampionshipState.initial()

  // AppState.initialState() : _location = "", _time = "00:00";
  );}

 AppState copyWith({
  required String baseUrl,
  required AuthState authState,
  required ChampionshipState championshipState
 })  {
  return AppState(authState: authState, championshipState: championshipState, baseUrl: baseUrl);
 }

}
