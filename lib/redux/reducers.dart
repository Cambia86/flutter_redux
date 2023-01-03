


import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:flutter_redux_project/redux/reducer/authReducer.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
  baseUrl: "ldaoid",
 authState: authReducer(state.authState, action));