import 'dart:convert';

import 'package:flutter_redux_project/redux/action/prevision_action.dart';
import 'package:flutter_redux_project/redux/model/prevision.dart';
import 'package:redux/redux.dart';
import '../model/app_state.dart';
import 'package:http/http.dart' as http;

class PrevisionMiddleware {
  static void fetchPrevisionMiddleware(
      Store<AppState> store, action, NextDispatcher next) {
    if (action is GetPrevisionAction) {
      PrevisionMiddleware.getChampionshipMatchPrevision(
              store.state.authState.token,
              store.state.championshipState.currentChampionship!.id,
              store.state.championshipState.seasonId,
              store.state.championshipState.currentChampionship!.currentSeason
                  .currentMatchday)
          .then((previsionList) {
        if (previsionList != null && previsionList.statusCode == "200") {
          store.dispatch(
              GetPrevisionActionSuccess(previsionList: previsionList));
          // action.onSuccess();
        } else {
          // store.dispatch(LoginOnlineActionFailure(loginInfo: loginInfo!));
        }
      }).catchError((onError) {});
    }

    if (action is DeletePrevisionAction) {
      PrevisionMiddleware.deleteChampionshipMatchPrevision(
              store.state.authState.token,
              store.state.championshipState.currentChampionship!.id,
              store.state.championshipState.seasonId,
              store.state.championshipState.currentChampionship!.currentSeason
                  .currentMatchday)
          .then((resp) {
        if (resp==true) {
          store.dispatch(
              DeletePrevisionActionSuccess());
             action.onSuccess();
          // action.onSuccess();
        } else {
          // store.dispatch(LoginOnlineActionFailure(loginInfo: loginInfo!));
        }
      }).catchError((onError) {});
    }
    next(action);
  }

  static Future<PrevisionList?> getChampionshipMatchPrevision(
      token, championshipId, seasonId, matchday) async {
    // ignore: prefer_interpolation_to_compose_strings
    String url = 'http://localhost:8080/api/v2/standing/recreateallprevision/' +
        championshipId.toString() +
        '/' +
        seasonId.toString() +
        '/' +
        matchday.toString() +
        '';
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Prevision> lstPrev =
          List<Prevision>.from(l.map((model) => Prevision.fromJson(model)));

      PrevisionList prevList = PrevisionList(
          lstPrevision: lstPrev, statusCode: response.statusCode.toString());
      return prevList;
    }
  }

  static Future<bool?> deleteChampionshipMatchPrevision(
      String? token, int championshipId, int seasonId, int matchday) async {
    String url = 'http://localhost:8080/api/v2/standing/deletePrevision/' +
        championshipId.toString() +
        '/' +
        seasonId.toString() +
        '/' +
        matchday.toString() +
        '';
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      // Iterable l = json.decode(response.body);
      
      return true;
    }
  }
}
