import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_project/redux/model/app_state.dart';
import 'package:flutter_redux_project/redux/model/login_info.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:redux/redux.dart';

import '../redux/action/authentication_action.dart';
import 'drawer_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Store<AppState> mystore = StoreProvider.of<AppState>(context);
    TextEditingController userText = TextEditingController(
        text: mystore.state.authState.username != null
            ? mystore.state.authState.username!
            : null);
    TextEditingController passwordText = TextEditingController(
        text: mystore.state.authState.password != null
            ? mystore.state.authState.password
            : null);
    final _formKey = GlobalKey<FormState>();

    bool _viewpass = true;

    void view() {
      setState(() {
        _viewpass = !_viewpass;
      });
    }

    return StoreConnector<AppState, AppState>(
      onInit: (store) => {
        // store.dispatch(const )
      },
      converter: (store) => store.state,
      builder: (BuildContext context, AppState state) {
        return Scaffold(
            appBar: AppBar(
              title: Text("login"),
            ),
            drawer: drawer_widget(),
            body: StoreConnector<AppState, AppState>(
              converter: (store) => store.state,
              builder: (context, state) {
                return state.authState.isLoading == true
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: const Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(children: [
                        Form(
                            key: _formKey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    style: TextStyle(fontSize: 20),
                                    keyboardType: TextInputType.text,
                                    controller: userText,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      labelText: "Username",
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: (mystore.state.authState
                                                          .username !=
                                                      null
                                                  // && mystore.state.authState.username!.loginError !=
                                                  //     ""
                                                  )
                                                  ? Colors.red
                                                  : Colors.blue),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        size: 20,
                                        color: (mystore
                                                    .state.authState.username !=
                                                null
                                            // && mystore.state.authState.username.loginError != ""
                                            )
                                            ? Colors.red
                                            : Colors.blue,
                                      ),
                                    ),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Campo obbligatorio';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    style: TextStyle(fontSize: 20),
                                    obscureText: _viewpass,
                                    controller: passwordText,
                                    cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: (mystore.state.authState
                                                          .password !=
                                                      null
                                                  //  &&   mystore.state.authState.password!.loginError !=""
                                                  )
                                                  ? Colors.red
                                                  : Colors.blue),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        size: 20,
                                        color: (mystore
                                                    .state.authState.password !=
                                                null
                                            // &&  mystore.state.loginInfo!.loginError != ""
                                            )
                                            ? Colors.red
                                            : Colors.blue,
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: view,
                                        icon: Icon(
                                          _viewpass
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Campo obbligatorio';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                   Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                  
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10),
                                        child: ButtonTheme(
                                          height: 40.0,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                Colors.blue,
                                              ),
                                              elevation:
                                                  MaterialStateProperty.all(0),
                                              shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18.0),
                                                ),
                                              ),
                                            ),
                                            onPressed: () {
                                              userText.text="admin";
                                              passwordText.text="password";
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                LoginInfo info = LoginInfo(
                                                    username: userText.text,
                                                    password: passwordText.text,
                                                    areCredentialsSaved: false);
                                                login(context, mystore, info);
                                              }
                                              // test(context, mystore,info);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 44),
                                              child: Text(
                                                'ACCEDI',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Navigator.pushReplacementNamed(context, PasswordDimenticataPage.routeName);
                                        },
                                        child: Text(
                                          "Password dimenticata?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                color: Colors.black,
                                              ),
                                        ),
                                      ),
                                    ],
                                  )
                                ])),
                        Container(
                          child: StoreConnector<AppState, AppState>(
                              converter: (store) => store.state,
                              builder: (context, state) {
                                return Text(state.authState.username != null
                                    ? state.authState.username!
                                    : "");
                              }),
                        ),
                        state.authState.errorCode != null
                            ? Container(
                                child: Text(state.authState.errorMessage))
                            : Container(),
                      ]);
              },
            ));
      },
    );
  }

  Future<void> login(
      BuildContext context, Store<AppState> store, LoginInfo loginInfo) async {
    //login online e sync
    store.dispatch(LoginOnlineAction(
        loginInfo: loginInfo,
        onSuccess: () {
           Navigator.pushNamed(context, '/championship');
          //  loadDataAndGoHome(store);
        }));
  }
}
