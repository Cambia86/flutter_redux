import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/action/championship_action.dart';
import '../redux/model/app_state.dart';
import 'drawer_widget.dart';

class PrevisionPage extends StatefulWidget {
  const PrevisionPage({Key? key}) : super(key: key);
  static const String routeName = '/prevision';

  @override
  State<StatefulWidget> createState() {
    return _PrevisionPageState();
  }
}

class _PrevisionPageState extends State<PrevisionPage> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> mystore = StoreProvider.of<AppState>(context);
    int matchday = mystore.state.championshipState.currentChampionship!
        .currentSeason.currentMatchday;
    int champid = mystore.state.championshipState.currentChampionship!.id;
    int seasonid = mystore.state.championshipState.seasonId;
    return StoreConnector<AppState, AppState>(
        onInit: (store) => {
              mystore.dispatch(GetMatchPrevisionListAction(
                  championshipId: champid,
                  seasonId: seasonid,
                  matchday: matchday))
            },
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Prevision"),
              ),
              drawer: drawer_widget(),
              body: Container());
        });
  }
}
