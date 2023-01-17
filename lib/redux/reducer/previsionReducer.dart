import 'package:flutter_redux_project/redux/action/prevision_action.dart';
import 'package:flutter_redux_project/redux/state/matchPrevisionState.dart';




MatchPrevisionState previsionReducer(MatchPrevisionState prevState, dynamic action) {
  MatchPrevisionState newState = MatchPrevisionState.fromPrevisionState(prevState);
  if (action is GetPrevisionAction) {
    newState.isLoading = true;
  }
  
  if (action is GetPrevisionActionSuccess) {
    newState.previsionList=action.previsionList;
    newState.isLoading = false;
  //   // newState.username != action.loginInfo.username;
  //   // newState.firstName = action.loginInfo.firstName;
  //   // newState.lastName = action.loginInfo.lastName;
  //   // newState.token = action.loginInfo.token;
  //   // newState.username = action.loginInfo.username;
  }
  // if (action is LoginOnlineActionFailure) {
  //   // newState.isLoading = false;
  //   // newState.errorCode=action.loginInfo.errorCode!=null?action.loginInfo.errorCode!:"";
  //   // newState.errorMessage=action.loginInfo.errorMessage!=null?action.loginInfo.errorMessage!:"";
  // }
  return newState;
}
