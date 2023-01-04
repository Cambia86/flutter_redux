
class LoginInfo {
  String? username;
  String? password;
  String? token;
  String? firstName;
  String? lastName;
  int? userId;
  bool areCredentialsSaved;
  String? errorCode;
  String? errorMessage;
  String? statusCode;

  String loginError;
  String? emailRecupero;
  LoginInfo(
      {this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.token,
      this.userId,
      this.errorMessage,
      bool? areCredentialsSaved,
      String? loginError,
      String? emailRecupero})
      : areCredentialsSaved = areCredentialsSaved ?? true,
        loginError = loginError ?? "",
        emailRecupero = emailRecupero ?? "";

  factory LoginInfo.fromJson(Map<String, dynamic> json) {
    return LoginInfo(
      username: json['username'],
      password: json['password'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      token: json['token'],
      userId: json['id'],
       errorMessage: json['errorMessage'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'userId': userId,
      'token': token,
      // 'areCredentialsSaved': areCredentialsSaved,
    };
  }
}
