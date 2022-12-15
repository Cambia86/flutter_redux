import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'drawer_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      drawer: drawer_widget(),
      body:Container());
  }
}