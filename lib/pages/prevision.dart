import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/action/championship_action.dart';
import 'package:flutter_redux_project/redux/action/prevision_action.dart';
import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:flutter_redux_project/redux/model/prevision.dart';
import 'package:redux/redux.dart';

import '../redux/model/championship.dart';
import 'drawer_widget.dart';

class PrevisionPage extends StatefulWidget {
  const PrevisionPage({Key? key}) : super(key: key);
  static const String routeName = '/prevision';

  @override
  State<PrevisionPage> createState() => _PrevisionPageState();
}

class _PrevisionPageState extends State<PrevisionPage> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> mystore = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, AppState>(
        onInit: (store) => {store.dispatch(const GetPrevisionAction())},
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Prevision"),
            ),
            drawer: drawer_widget(),
            body: state.previsionState.previsionList == null
                ? Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    children: [
                      listmatch(state),
                    ],
                  ),
          );
        });
  }

  Expanded listmatch(AppState state) {
    return Expanded(
        child: ListView.builder(
            itemCount: state.previsionState.previsionList!.lstPrevision.length,
            itemBuilder: (BuildContext context, int index) {
              Prevision prev =
                  state.previsionState.previsionList!.lstPrevision[index];
              return Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(padding: const EdgeInsets.only(left: 20, top: 10, right: 20),child: Text(prev.homeTeam.name!)),
                    Container(padding: const EdgeInsets.only(left: 20, top: 10, right: 20),child: Text(prev.awayTeam.name!)),
                  ],
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(padding: const EdgeInsets.only(left: 20, top: 10, right: 20),child: Text(prev.allMatch.winHome.toString() + "( "+prev.allMatch.winHomePerc.toString()  + " )")),
                    Container(padding: const EdgeInsets.only(left: 20, top: 10, right: 20),child: Text(prev.allMatch.draw.toString()+ "( "+prev.allMatch.drawPerc.toString()  + " )")),
                    Container(padding: const EdgeInsets.only(left: 20, top: 10, right: 20),child: Text(prev.allMatch.winAway.toString()+ "( "+prev.allMatch.winAwayPerc.toString()  + " )")),
                  ],
                ),
                //  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //  children: [
                //    Container(padding: const EdgeInsets.only(left: 20, top: 10, right: 20),child: Text(prev.allMatch.winHome.toString() + "( "+prev.allMatch.winHomePerc.toString()  + " )")),
                //  ],),
                SizedBox(height: 10),
              ]);
            }));
  }
}
