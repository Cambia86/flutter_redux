import 'package:flutter/material.dart';

class AuthState {
  String? username;
  String? password;
  String? token;
  String? firstName;
  String? lastName;
  int? userId;

  AuthState(
      {this.username,
      this.password,
      this.firstName,
      this.lastName,
      this.token,
      this.userId});

  factory AuthState.initial() {
    return AuthState(
        username: "",
        password: "",
        firstName: "",
        lastName: "",
        token: "",
        userId: 0);
  }

  AuthState.fromAuthState(AuthState state) {
    username:
    state.username;
    password:
    state.password;
    token:
    state.token;
    userId:
    state.userId;
  }

  String getUserDesc(){
    return '${firstName} ${lastName}'; 
  }
}
