import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/action/championship_action.dart';
import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:redux/redux.dart';

import '../redux/model/championship.dart';
import 'drawer_widget.dart';

class ChampionshipPage extends StatefulWidget {
  const ChampionshipPage({Key? key}) :super(key:key);
static const String routeName ='/championship';

  @override
  State<ChampionshipPage> createState() => _ChampionshipPageState();
}

class _ChampionshipPageState extends State<ChampionshipPage> {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> mystore = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, AppState>(
        onInit: (store) => {store.dispatch(const GetChampionshipAction())},
        converter: (store) => store.state,
        builder: (BuildContext context, AppState state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("Championship"),
              ),
              drawer: drawer_widget(),
              body: state.championshipState.championshipList == null
                  ? Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Container(
                      child: ListView.builder(
                      itemCount:
                          state.championshipState.championshipList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 20,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 1.0,
                                        color: Colors.lightBlue.shade900),
                                  ),
                                ),
                              ),
                              Container(
                                  width: 50,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 1.0,
                                          color: Colors.lightBlue.shade900),
                                    ),
                                  ),
                                  child: Image.network(state.championshipState
                                      .championshipList![index].emblemUrl)),
                              Expanded(
                                  child: Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                              width: 1.0,
                                              color: Colors.lightBlue.shade900),
                                        ),
                                      ),
                                      child: Center(
                                          child: Text(
                                              '${state.championshipState.championshipList![index].name}')))),
                            ],
                          ),
                          onTap: () {
                            Championship champ = state
                                .championshipState.championshipList![index];

                            mystore.dispatch(SelectChampionshipAction(
                                selectedChampionship: champ,
                                  onSuccess: () {
                                     Navigator.pushNamed(context, '/championshipDetail');
                                  }));
                          },
                        );
                      },
                    )));
        });
  }
}
