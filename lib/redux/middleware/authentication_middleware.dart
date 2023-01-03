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
      AuthenticationMiddleware.login(loginInfo: action.loginInfo).then((loginInfo) {
        if (loginInfo != null) {
          store.dispatch(LoginOnlineActionSuccess(loginInfo: loginInfo));
        }
      });
    }
  }

  static Future<LoginInfo?> login({required LoginInfo loginInfo}) async {
    LoginInfo info;
    try {
      Response response = await post(
          Uri.parse('http://localhost:8080/api/login'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'username': loginInfo.username!,
            'password': loginInfo.password!
          }));
      LoginInfo authinfo = LoginInfo.fromJson(jsonDecode(response.body));
       return authinfo;
    } catch (e) {
      print('caught error: $e');
      return null;
    }
  }
}
