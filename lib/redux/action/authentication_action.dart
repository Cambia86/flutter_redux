
import '../model/login_info.dart';

class LoginOnlineAction{
  const LoginOnlineAction({required this.loginInfo, required this.onSuccess});
  final Function onSuccess;
  final LoginInfo loginInfo;
}

class LoginOnlineActionSuccess {
  const LoginOnlineActionSuccess({ required this.loginInfo});
  final LoginInfo loginInfo;
}
