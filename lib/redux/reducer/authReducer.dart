import 'package:flutter_redux_project/redux/state/authState.dart';

import '../action/authentication_action.dart';

AuthState authReducer(AuthState prevState, dynamic action) {
  AuthState newState = AuthState.fromAuthState(prevState);
  if (action is LoginOnlineAction) {
    newState.isLoading = true;
  }

  if (action is LoginOnlineActionSuccess) {
    newState.isLoading = false;
    newState.username != action.loginInfo.username;
    newState.firstName = action.loginInfo.firstName;
    newState.lastName = action.loginInfo.lastName;
    newState.token = action.loginInfo.token;
    newState.username = action.loginInfo.username;
  }
  if (action is LoginOnlineActionFailure) {
    newState.isLoading = false;
    newState.errorCode=action.loginInfo.errorCode!=null?action.loginInfo.errorCode!:"";
    newState.errorMessage=action.loginInfo.errorMessage!=null?action.loginInfo.errorMessage!:"";
  }
  return newState;
}
