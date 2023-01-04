import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/pages/detail_page.dart';
import 'package:flutter_redux_project/pages/drawer_widget.dart';
import 'package:flutter_redux_project/pages/login_page.dart';
import 'package:flutter_redux_project/redux/middleware/authentication_middleware.dart';
import 'package:flutter_redux_project/redux/middleware/championship_middleware.dart';
import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:flutter_redux_project/redux/reducers.dart';
import 'package:redux/redux.dart';

import 'pages/championship_list_page.dart';

Store<AppState> getStoreWithParams() {
  var store = Store<AppState>(appReducer,
      initialState: AppState.initial(),
      middleware: [
        AuthenticationMiddleware.fetchAuthMiddleware,
        ChampionshipMiddleware.fetchChampionshipMiddleware
      ]);
  return store;
}

Future<void> main() async {
  final Store<AppState> store = getStoreWithParams();
  runApp(MyApp(store: store));
}

typedef FetchTime = void Function();

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({required this.store});
  // final store = Store(reducer,
  //     initialState: AppState.initialState(), middleware: [thunkMiddleware]);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: MyHomePage(),
          initialRoute: '/',
          routes: {
            '/': (context) => MyHomePage(),
            '/login': (context) => LoginPage(),
            '/details': (context) => DetailScreen(),
            '/championship': (context) => ChampionshipPage(),
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("app test"),
      ),
      drawer: drawer_widget(),
      body: Center(
        child: Container(
          height: 400.0,
          // child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       // display time and location
          //       // StoreConnector<AppState, AppState>(
          //       //   converter: (store) => store.state,
          //       //   builder: (_, state) {
          //       //     return Text(
          //       //       'The time in ${state.location} is ${state.time}',
          //       //       textAlign: TextAlign.center,
          //       //       style: const TextStyle(
          //       //           fontSize: 40.0, fontWeight: FontWeight.bold),
          //       //     );
          //       //   },
          //       // ),
          //       // fetch time button
          //       // StoreConnector<AppState, FetchTime>(
          //       //   converter: (store) => () => store.dispatch(fetchTime),
          //       //   builder: (_, fetchTimeCallback) {
          //       //     return SizedBox(
          //       //       width: 250,
          //       //       height: 50,
          //       //       child: ElevatedButton(
          //       //           style: ButtonStyle(
          //       //               backgroundColor:
          //       //                   MaterialStateProperty.all(Colors.amber),
          //       //               textStyle: MaterialStateProperty.all(
          //       //                 TextStyle(
          //       //                   color: Colors.brown,
          //       //                 ),
          //       //               )),
          //       //           onPressed: fetchTimeCallback,
          //       //           child: const Text(
          //       //             "Click to fetch time",
          //       //             style: TextStyle(
          //       //                 color: Colors.brown,
          //       //                 fontWeight: FontWeight.w600,
          //       //                 fontSize: 25),
          //       //           )),
          //       //     );
          //       //   },
          //       // )
          //     ]),
        ),
      ),
    );
  }
}
