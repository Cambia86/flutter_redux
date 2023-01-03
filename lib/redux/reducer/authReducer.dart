



import 'package:flutter_redux_project/redux/state/authState.dart';

import '../action/authentication_action.dart';

AuthState authReducer(AuthState prevState, dynamic action) {
  AuthState newState = AuthState.fromAuthState(prevState);
  if (action is LoginOnlineAction) {}

  if (action is LoginOnlineActionSuccess) {
     newState.username!= action.loginInfo.username;
     newState.firstName= action.loginInfo.firstName;
     newState.lastName= action.loginInfo.lastName;
     newState.token= action.loginInfo.token;
       newState.username= action.loginInfo.username;
  }
  return newState;
}