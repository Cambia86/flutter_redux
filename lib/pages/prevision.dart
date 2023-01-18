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
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text("Prevision"),
              centerTitle: true,
              actions: [
                Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () {
                        mystore.dispatch(DeletePrevisionAction(
                          championshipId:
                              state.championshipState.currentChampionship!.id,
                          matchday: mystore
                              .state
                              .championshipState
                              .currentChampionship!
                              .currentSeason
                              .currentMatchday,
                          seasonId: state.previsionState.seasonId,
                        ));
                      },
                      child: Icon(
                        Icons.delete,
                        size: 26.0,
                      ),
                    )),
              ],
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
                      listmatch(state, mystore),
                    ],
                  ),
          );
        });
  }

  Expanded listmatch(AppState state, Store<AppState> mystore) {
    return Expanded(
        child: ListView.builder(
            itemCount: state.previsionState.previsionList!.lstPrevision.length,
            itemBuilder: (BuildContext context, int index) {
              Prevision prev =
                  state.previsionState.previsionList!.lstPrevision[index];

              String scoreht = prev.score.fullTime != null
                  ? ": " + prev.score.fullTime!.homeTeam.toString()
                  : "";
              String scoreat = prev.score.fullTime != null
                  ? ": " + prev.score.fullTime!.awayTeam.toString()
                  : "";
              return Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: Text(prev.homeTeam.name! + scoreht)),
                    Container(
                        padding:
                            const EdgeInsets.only(left: 20, top: 10, right: 20),
                        child: Text(prev.awayTeam.name! + scoreat)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    boxKeyValue(
                        "1",
                        prev.allMatch.winHome,
                        prev.allMatch.winHomePerc,
                        prev.allMatch.winHomeSelected, () {
                      mystore.dispatch(
                          AddPrevisionToCart(prevision: prev, choice: "1"));
                    }),
                    boxKeyValue("X", prev.allMatch.draw, prev.allMatch.drawPerc,
                        prev.allMatch.drawSelected, () {
                      mystore.dispatch(
                          AddPrevisionToCart(prevision: prev, choice: "X"));
                    }),
                    boxKeyValue(
                        "2",
                        prev.allMatch.winAway,
                        prev.allMatch.winAway,
                        prev.allMatch.winAwaySelected, () {
                      mystore.dispatch(
                          AddPrevisionToCart(prevision: prev, choice: "2"));
                    }),
                  ],
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue("GG", prev.goal.quota, prev.goal.quotaPerc,
                          prev.goal.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "GOAL"));
                      }),
                      boxKeyValue("NO-GG", prev.noGoal.quota,
                          prev.noGoal.quotaPerc, prev.noGoal.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "NO-GOAL"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue("OV 1,5", prev.over_15.quota,
                          prev.over_15.quotaPerc, prev.over_15.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "OVER 1,5"));
                      }),
                      boxKeyValue(
                          "UN 1,5",
                          prev.under_15.quota,
                          prev.under_15.quotaPerc,
                          prev.under_15.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "UNDER 1,5"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue("OV 2,5", prev.over_25.quota,
                          prev.over_25.quotaPerc, prev.over_25.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "OVER 2,5"));
                      }),
                      boxKeyValue(
                          "UN 2,5",
                          prev.under_25.quota,
                          prev.under_25.quotaPerc,
                          prev.under_25.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "UNDER 2,5"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue("OV 3,5", prev.over_35.quota,
                          prev.over_35.quotaPerc, prev.over_35.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "OVER 3,5"));
                      }),
                      boxKeyValue(
                          "UN 3,5",
                          prev.under_35.quota,
                          prev.under_35.quotaPerc,
                          prev.under_35.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "UNDER 3,5"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue(
                          "G 1-3",
                          prev.goal_1_3.quota,
                          prev.goal_1_3.quotaPerc,
                          prev.goal_1_3.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Goal 1-3"));
                      }),
                      boxKeyValue(
                          "G 1-4",
                          prev.goal_1_4.quota,
                          prev.goal_1_4.quotaPerc,
                          prev.goal_1_4.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Goal 1-4"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue(
                          "G 1-5",
                          prev.goal_1_5.quota,
                          prev.goal_1_5.quotaPerc,
                          prev.goal_1_5.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Goal 1-5"));
                      }),
                      boxKeyValue(
                          "G 2-4",
                          prev.goal_2_4.quota,
                          prev.goal_2_4.quotaPerc,
                          prev.goal_2_4.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Goal 2-4"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue(
                          "Goal 2-5",
                          prev.goal_2_5.quota,
                          prev.goal_2_5.quotaPerc,
                          prev.goal_2_5.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Goal 2-5"));
                      }),
                      boxKeyValue(
                          "Goal 3-6",
                          prev.goal_3_6.quota,
                          prev.goal_3_6.quotaPerc,
                          prev.goal_3_6.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Goal 3-6"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue(
                          "Casa 1-3",
                          prev.goal_1_3_casa.quota,
                          prev.goal_1_3_casa.quotaPerc,
                          prev.goal_1_3_casa.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Casa 1-3"));
                      }),
                      boxKeyValue(
                          "Casa 1-4",
                          prev.goal_1_4_casa.quota,
                          prev.goal_1_4_casa.quotaPerc,
                          prev.goal_1_4_casa.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Casa 1-4"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue(
                          "Casa 2-4",
                          prev.goal_2_4_casa.quota,
                          prev.goal_2_4_casa.quotaPerc,
                          prev.goal_2_4_casa.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Casa 2-4"));
                      }),
                      boxKeyValue(
                          "Fuori 1-3",
                          prev.goal_1_3_ospite.quota,
                          prev.goal_1_3_ospite.quotaPerc,
                          prev.goal_1_3_ospite.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Fuori 1-3"));
                      }),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      boxKeyValue(
                          "Fuori 1-4",
                          prev.goal_1_4_ospite.quota,
                          prev.goal_1_4_ospite.quotaPerc,
                          prev.goal_1_4_ospite.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Fuori 1-4"));
                      }),
                      boxKeyValue(
                          "Fuori 2-4",
                          prev.goal_2_4_ospite.quota,
                          prev.goal_2_4_ospite.quotaPerc,
                          prev.goal_2_4_ospite.isSelected, () {
                        mystore.dispatch(AddPrevisionToCart(
                            prevision: prev, choice: "Fuori 2-4"));
                      }),
                    ]),
                SizedBox(height: 10),
              ]);
            }));
  }

  Flexible boxKeyValue(String key, double value, double valuePerc,
      bool isSelected, final VoidCallback onClickAction) {
    return Flexible(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: isSelected ? Colors.blue : Colors.white,
            backgroundColor: isSelected ? Colors.white : Colors.blue,
            side: BorderSide(
                width: 3, color: Colors.blue), //border width and color
            elevation: 3, //elevation of button
            shape: RoundedRectangleBorder(
                // borderRadius: BorderRadius.circular(30)
                ),
            padding: EdgeInsets.all(5) //content padding inside button
            ),
        onPressed: onClickAction,
        child: Container(
            margin: const EdgeInsets.only(left: 5, top: 5, right: 5, bottom: 5),
            child: Text(
                '${key}: ${value.toString()} ( ${valuePerc.toString()} )')),
      ),
    );
  }
}
