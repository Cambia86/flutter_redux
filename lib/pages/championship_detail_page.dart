import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/action/championship_action.dart';
import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:redux/redux.dart';

import '../redux/model/MatchList.dart';
import '../redux/model/championship.dart';
import 'drawer_widget.dart';

class ChampionshipDetailPage extends StatefulWidget {
  const ChampionshipDetailPage({Key? key}) : super(key: key);
  static const String routeName = '/championshipDetail';

  @override
  State<ChampionshipDetailPage> createState() => ChampionshipDetailPageState();
}

class ChampionshipDetailPageState extends State<ChampionshipDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> mystore = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, AppState>(
        onInit: (store) => {
              store.dispatch(GetChampionshipMatchListAction(
                  championshipId:
                      mystore.state.championshipState.currentChampionship!.id,
                  seasonId: mystore.state.championshipState.seasonId))
            },
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Championship detail"),
              ),
              drawer: drawer_widget(),
              body: mystore.state.championshipState.matchList == null
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                 int curmathday=state.championshipState.currentChampionship!
                                    .currentSeason!.currentMatchday;
                                 mystore.dispatch(ChangeMatchDAy(matchday:curmathday-1));
                              },
                              child: Icon(Icons.arrow_back    , color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor:
                                    Colors.blue, // <-- Button color
                                foregroundColor: Colors.red, // <-- Splash color
                              ),
                            ),
                            // ignore: prefer_interpolation_to_compose_strings
                            Text("day: " +
                                state.championshipState.currentChampionship!
                                    .currentSeason.currentMatchday
                                    .toString()),
                            ElevatedButton(
                              onPressed: () {
                                 int curmathday=state.championshipState.currentChampionship!
                                    .currentSeason!.currentMatchday;
                                 mystore.dispatch(ChangeMatchDAy(matchday:curmathday+1));
                              },
                              child: Icon(Icons.arrow_forward    , color: Colors.white),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(10),
                                backgroundColor:
                                    Colors.blue, // <-- Button color
                                foregroundColor: Colors.red, // <-- Splash color
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: state.championshipState
                                  .currentMatchDayList!.length,
                              itemBuilder: (BuildContext context, int index) {
                                MatchItem mi = state.championshipState
                                    .currentMatchDayList![index];
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        getTeamREsult(mi.homeTeam!,
                                            mi.score!.fullTime!.homeTeam),
                                        getTeamREsult(mi.awayTeam!,
                                            mi.score!.fullTime!.awayTeam),
                                      ],
                                    ),
                                    // altre info del match
                                    // ....
                                  ],
                                );
                              }),
                        ),
                      ],
                    ));
        });
  }

  Row getTeamREsult(Team team, int? res) {
    return Row(
      children: [
        Container(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Text(team.name!.length > 15
                ? team.name!.substring(1, 15)
                : team.name!)),
        Container(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Text(res != null ? res.toString() : ""))
      ],
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.black87,
    primary: Colors.grey[300],
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
}
