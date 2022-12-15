import 'package:flutter_redux_project/redux/model/app_state.dart';

import '../action/time_action.dart';

AppState reducer(AppState prev, dynamic action) {
  if (action is FetchTimeAction) {
    return AppState(action.location, action.time);
  } else {
    return prev;
  }
}