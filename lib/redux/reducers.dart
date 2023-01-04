


import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:flutter_redux_project/redux/reducer/authReducer.dart';

import 'reducer/championshipReducer.dart';

AppState appReducer(AppState state, dynamic action) => AppState(
  baseUrl: "ldaoid",
 authState: authReducer(state.authState, action),
 championshipState: championshipReducer(state.championshipState, action));