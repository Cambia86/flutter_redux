import 'dart:convert';

import 'package:http/http.dart';
import 'package:redux/redux.dart';

import '../action/authentication_action.dart';
import '../model/app_state.dart';
import '../model/login_info.dart';

class AuthenticationMiddleware {
  static void fetchAuthMiddleware(
      Store<AppState> store, action, NextDispatcher next) {
    if (action is LoginOnlineAction) {
      AuthenticationMiddleware.login(loginInfo: action.loginInfo)
          .then((loginInfo) {
        if (loginInfo != null && loginInfo.statusCode == "200") {
        
          store.dispatch(LoginOnlineActionSuccess(loginInfo: loginInfo));
            action.onSuccess();
        } else {
          store.dispatch(LoginOnlineActionFailure(loginInfo: loginInfo!));
        }
      }).catchError((onError) {});
    }
    next(action);
  }

  static Future<LoginInfo?> login({required LoginInfo loginInfo}) async {
    LoginInfo info;
    Response response = await post(Uri.parse('http://localhost:8080/api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': loginInfo.username!,
          'password': loginInfo.password!
        }));

    if (response.statusCode != 200) {
      LoginInfo authinfo = LoginInfo.fromJson(jsonDecode(response.body));
      authinfo.errorCode = response.statusCode.toString();
      authinfo.statusCode = response.statusCode.toString();
      return authinfo;
      } else {
      LoginInfo authinfo = LoginInfo.fromJson(jsonDecode(response.body));
       authinfo.statusCode = response.statusCode.toString();
      return authinfo;
    }
  }
}
