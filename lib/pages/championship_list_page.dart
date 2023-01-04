import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/action/championship_action.dart';
import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:redux/redux.dart';

import 'drawer_widget.dart';

class ChampionshipPage extends StatefulWidget {
  @override
  State<ChampionshipPage> createState() => _ChampionshipPageState();
}

class _ChampionshipPageState extends State<ChampionshipPage> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> mystore = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, AppState>(
        onInit: (store) => {store.dispatch(GetChampionshipAction())},
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Championship"),
              ),
              drawer: drawer_widget(),
              body:
                state.championshipState.championshipList==null?
               Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                      ):
               Container(
                  child: ListView.builder(
                itemCount: state.championshipState.championshipList!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 50,
                      child: Center(
                          child: Text(
                              'Entry ${state.championshipState.championshipList![index].name}')));
                },
              )));
        });
  }
}
