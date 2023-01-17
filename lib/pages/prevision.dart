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
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text("Prevision"),
              centerTitle: true,
            ),
            // drawer: drawers_widget(true),
            body: state.previsionState.isLoading == true
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


              String scoreht=prev.score.fullTime != null ? ": "+ prev.score.fullTime!.homeTeam.toString():"";                  
              String scoreat=prev.score.fullTime != null ?  ": "+prev.score.fullTime!.awayTeam.toString():"";                  
              return Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: Text(prev.homeTeam.name! + scoreht )),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: Text(prev.awayTeam.name! + scoreat)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    boxKeyValue(
                        "1", prev.allMatch.winHome, prev.allMatch.winHomePerc),
                    boxKeyValue(
                        "X", prev.allMatch.draw, prev.allMatch.drawPerc),
                    boxKeyValue(
                        "2", prev.allMatch.winAway, prev.allMatch.winAway),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("GOAL", prev.goal.quota, prev.goal.quotaPerc),
                  boxKeyValue(
                      "NO-GOAL", prev.noGoal.quota, prev.noGoal.quotaPerc),
                ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("OVER 1,5", prev.over_15.quota, prev.over_15.quotaPerc),
                  boxKeyValue(
                      "UNDER 1,5", prev.under_15.quota, prev.under_15.quotaPerc),
                ]),
                
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("OVER 2,5", prev.over_25.quota, prev.over_25.quotaPerc),
                  boxKeyValue(
                      "UNDER 2,5", prev.under_25.quota, prev.under_25.quotaPerc),
                ]),  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("OVER 3,5", prev.over_35.quota, prev.over_35.quotaPerc),
                  boxKeyValue(
                      "UNDER 3,5", prev.under_35.quota, prev.under_35.quotaPerc),
                ]), Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("Goal 1-3", prev.goal_1_3.quota, prev.goal_1_3.quotaPerc),
                  boxKeyValue(
                      "Goal 1-4", prev.goal_1_4.quota, prev.goal_1_4.quotaPerc),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("Goal 1-5", prev.goal_1_5.quota, prev.goal_1_5.quotaPerc),
                  boxKeyValue(
                      "Goal 2-4", prev.goal_2_4.quota, prev.goal_2_4.quotaPerc),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("Goal 2-5", prev.goal_2_5.quota, prev.goal_2_5.quotaPerc),
                  boxKeyValue(
                      "Goal 3-6", prev.goal_3_6.quota, prev.goal_3_6.quotaPerc),
                ]),
                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("Casa 1-3", prev.goal_1_3_casa.quota, prev.goal_1_3_casa.quotaPerc),
                  boxKeyValue(
                      "Casa 1-4", prev.goal_1_4_casa.quota, prev.goal_1_4_casa.quotaPerc),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("Casa 2-4", prev.goal_2_4_casa.quota, prev.goal_2_4_casa.quotaPerc),
                  boxKeyValue(
                      "Fuori 1-3", prev.goal_1_3_ospite.quota, prev.goal_1_3_ospite.quotaPerc),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  boxKeyValue("Fuori 1-4", prev.goal_1_4_ospite.quota, prev.goal_1_4_ospite.quotaPerc),
                  boxKeyValue(
                      "Fuori 2-4", prev.goal_2_4_ospite.quota, prev.goal_2_4_ospite.quotaPerc),
                ]),
            
                SizedBox(height: 10),
              ]);
            }));
  }

  Flexible boxKeyValue(String key, double value, double valuePerc) {
    return Flexible(
      child: Container(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Text(key +
              ": " +
              value.toString() +
              "( " +
              valuePerc.toString() +
              " )")),
    );
  }
}
