import 'package:flutter_redux_project/redux/action/prevision_action.dart';
import 'package:flutter_redux_project/redux/model/prevision.dart';
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
  if(action is AddPrevisionToCart){
    Bet b=Bet(prev:  action.prevision, choice: action.choice);
    newState.betList.add(b);

    if(action.choice=="GOAL")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal.isSelected;
    if(action.choice=="NO-GOAL")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].noGoal.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].noGoal.isSelected;
    if(action.choice=="OVER 1,5")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].over_15.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].over_15.isSelected;
    if(action.choice=="UNDER 1,5")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].under_15.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].under_15.isSelected;
    if(action.choice=="OVER 2,5")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].over_25.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].over_25.isSelected;
    if(action.choice=="UNDER 2,5")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].under_25.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].under_25.isSelected;
    if(action.choice=="OVER 3,5")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].over_35.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].over_35.isSelected;
    if(action.choice=="UNDER 3,5")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].under_35.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].under_35.isSelected;
    
     if(action.choice=="Goal 1-3")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_3.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_3.isSelected;
    if(action.choice=="Goal 1-4")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_4.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_4.isSelected;
    if(action.choice=="Goal 1-5")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_5.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_5.isSelected;

     if(action.choice=="Goal 2-4")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_2_4.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_2_4.isSelected;
    if(action.choice=="Goal 2-5")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_2_5.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_2_5.isSelected;
    if(action.choice=="Goal 3-6")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_3_6.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_3_6.isSelected;
    
     if(action.choice=="Casa 1-3")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_3_casa.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_3_casa.isSelected;
    if(action.choice=="Casa 1-4")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_4_casa.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_4_casa.isSelected;
    if(action.choice=="Casa 2-4")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_2_4_casa.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_2_4_casa.isSelected;
      if(action.choice=="Fuori 1-3")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_3_ospite.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_3_ospite.isSelected;
    if(action.choice=="Fuori 1-4")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_4_ospite.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_1_4_ospite.isSelected;
    if(action.choice=="Fuori 2-4")
      newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_2_4_ospite.isSelected=!newState.previsionList!.lstPrevision.where((i) => i.id ==action.prevision.id).toList()[0].goal_2_4_ospite.isSelected;
    
    
  }

  return newState;
}
