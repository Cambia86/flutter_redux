import 'package:flutter_redux_project/redux/model/login_info.dart';
import 'package:flutter_redux_project/redux/state/authState.dart';

class AppState {
  // final String _location;
  // final String _time;

  // LoginInfo? loginInfo;

  // String get location => _location;
  // String get time => _time;

  final AuthState authState;
  AppState( {required this.authState, required String baseUrl});

  factory AppState.initial(){
    return AppState(
      // appConfigState: initialState,
      baseUrl:"localhost:4040",
      authState: AuthState.initial(),

  // AppState.initialState() : _location = "", _time = "00:00";
  );}
   

}
