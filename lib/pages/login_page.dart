import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/model/app_state.dart';

import 'drawer_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,AppState>(
      onInit: (store) => {
        // store.dispatch(const )
      },
      converter: (store) => store.state,
      builder: (BuildContext context,AppState state){
        
        return Scaffold(
            appBar: AppBar(
        title: Text("widget.title"),
      ),
      drawer: drawer_widget(),
      body: Container(child: Text("login page"),));
      } ,
    );
  }
}
