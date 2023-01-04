
import '../model/login_info.dart';

class LoginOnlineAction{
  const LoginOnlineAction({required this.loginInfo, required this.onSuccess});
  final LoginInfo loginInfo;
    final Function onSuccess;
}

class LoginOnlineActionSuccess {
  const LoginOnlineActionSuccess({ required this.loginInfo});
  final LoginInfo loginInfo;
}


class LoginOnlineActionFailure {
  const LoginOnlineActionFailure({ required this.loginInfo});
  final LoginInfo loginInfo;
}

// class LoginOnlineActionFailure {
//   const LoginOnlineActionFailure({ required this.LoginInfo});
//   final LoginInfo LoginInfo;
// }


