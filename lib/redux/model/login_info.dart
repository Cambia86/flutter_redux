
class LoginInfo{

  String? username;
  String? password;
  String? token;
  String? firstName;
  String? lastName;
  int? userId;
  bool areCredentialsSaved;
 
  String loginError;
  String? emailRecupero;
  LoginInfo({ this.username,  this.password,String? firstName,String? lastName,  String? token, int?  userId, bool? areCredentialsSaved,  String? loginError, String? emailRecupero})
  :
  areCredentialsSaved= areCredentialsSaved ?? true,
  loginError= loginError ?? "",
  emailRecupero=emailRecupero??"";


  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    return LoginInfo(
      userId:  json['id'],
      username: json['username'],
      firstName: json['firstName'],
       lastName: json['lastName'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'userId':userId,
      'token': token,
      // 'areCredentialsSaved': areCredentialsSaved,
    };
  }
}