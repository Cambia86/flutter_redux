import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/action/championship_action.dart';
import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:redux/redux.dart';

import '../redux/model/championship.dart';
import 'drawer_widget.dart';


class ChampionshipDetailPage extends StatefulWidget {
  @override
  State<ChampionshipDetailPage> createState() => ChampionshipDetailPageState();
}

class ChampionshipDetailPageState extends State<ChampionshipDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> mystore = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, AppState>(
        onInit: (store) => {store.dispatch(GetChampionshipMatchListAction(
          championshipId:mystore.state.championshipState.currentChampionship!.id  ,seasonId:mystore.state.championshipState.seasonId
            
        ))},
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Championship detail"),
              ),
              drawer: drawer_widget(),
              body:
                  mystore.state.championshipState.matchList==null ?
                  Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : 

                 Container(child:Text("body"))
          );});}}