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
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              title: Text("widget.title"),
            ),
            drawer: drawer_widget(),
            body: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            style: TextStyle(fontSize: 20),
                            // Theme.of(context)
                            //     .textTheme
                            //     .displaySmall!
                            //     .copyWith(color: Colors.black),
                            keyboardType: TextInputType.text,
                            controller: userText,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: (mystore.state.loginInfo != null && mystore.state.loginInfo!.loginError != "") ? ColoriApp.coloreQuaternario : ColoriApp.sfondoAppBar)),
                              // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: (mystore.state.loginInfo != null && mystore.state.loginInfo!.loginError != "") ?  ColoriApp.coloreQuaternario : ColoriApp.sfondoAppBar)),
                              // border: OutlineInputBorder(borderSide: BorderSide(color: (mystore.state.loginInfo != null && mystore.state.loginInfo!.loginError != "") ? ColoriApp.coloreQuaternario : ColoriApp.sfondoAppBar)),
                              // floatingLabelBehavior: FloatingLabelBehavior.always,
                              // hintText: 'Insert your username',
                              // hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black),

                              labelText: "Username",
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: (mystore
                                                  .state.authState.username !=
                                              null
                                          // && mystore.state.authState.username!.loginError !=
                                          //     ""
                                          )
                                          ? Colors.red
                                          : Colors.blue),
                              prefixIcon: Icon(
                                Icons.person,
                                size: 20,
                                color: (mystore.state.authState.username != null
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
                              // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: (mystore.state.loginInfo != null && mystore.state.loginInfo!.loginError != "") ? ColoriApp.coloreQuaternario : ColoriApp.sfondoAppBar)),
                              // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: (mystore.state.loginInfo != null && mystore.state.loginInfo!.loginError != "") ? ColoriApp.coloreQuaternario : ColoriApp.sfondoAppBar)),
                              // border: OutlineInputBorder(borderSide: BorderSide(color: (mystore.state.loginInfo != null && mystore.state.loginInfo!.loginError != "") ? ColoriApp.coloreQuaternario : ColoriApp.sfondoAppBar)),
                              // floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: 'Password',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color: (mystore
                                                  .state.authState.password !=
                                              null
                                          //  &&   mystore.state.authState.password!.loginError !=""
                                          )
                                          ? Colors.red
                                          : Colors.blue),
                              // hintText: 'Enter your password',
                              // hintStyle: Theme.of(context)
                              //     .textTheme
                              //     .displaySmall!
                              //     .copyWith(color: Colors.black),
                              prefixIcon: Icon(
                                Icons.lock,
                                size: 20,
                                color: (mystore.state.authState.password != null
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
                          // Text(
                          //   mystore.state.loginInfo != null
                          //       ? mystore.state.loginInfo!.loginError
                          //       : "",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .displaySmall!
                          //       .copyWith(color: Colors.black),
                          //   textAlign: TextAlign.start,
                          // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Row(
                              //   children: [
                              //     FlutterSwitch(
                              //       width: 45.0,
                              //       height: 30.0,
                              //       toggleColor: Colors.white,
                              //       activeColor: const Color(0xFFE0E0E0),
                              //       valueFontSize: 25.0,
                              //       toggleSize: 25.0,
                              //       value: true,
                              //       borderRadius: 30.0,
                              //       padding: 0,
                              //       showOnOff: false,
                              //       onToggle: (val) {
                              //         // LoginInfo info = LoginInfo(username: userText.text, password: passwordText.text, areCredentialsSaved: val);
                              //         // mystore.dispatch(LoginSwitchAction(loginInfo: info));
                              //       },
                              //     ),
                              //     const SizedBox(
                              //       width: 10,
                              //     ),
                              //     Text("Salva dati di accesso", style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black,),),
                              //   ],
                              // ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: ButtonTheme(
                                  height: 40.0,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        Colors.blue,
                                      ),
                                      elevation: MaterialStateProperty.all(0),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        LoginInfo info = LoginInfo(
                                            username: userText.text,
                                            password: passwordText.text,
                                            areCredentialsSaved: false);
                                        login(context, mystore, info);
                                      }
                                      // test(context, mystore,info);
                                    },
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 44),
                                      child: Text(
                                        'ACCEDI',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
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
                        return Text( state.authState.username !=null ?state.authState.username!:"");
                      }),
                )
              ],
            ));
      },
    );
  }

  Future<void> login(
      BuildContext context, Store<AppState> store, LoginInfo loginInfo) async {
    //login online e sync
    store.dispatch(LoginOnlineAction(
        loginInfo: loginInfo,
        onSuccess: (res) {
          //  loadDataAndGoHome(store);
        }));
  }
}
