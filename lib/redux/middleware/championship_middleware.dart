import 'dart:convert';

import 'package:flutter_redux_project/redux/action/championship_action.dart';
import 'package:flutter_redux_project/redux/model/MatchList.dart';
import 'package:flutter_redux_project/redux/model/championship.dart';
// import 'package:http/http.dart';
import 'package:redux/redux.dart';
import '../model/app_state.dart';
import 'package:http/http.dart' as http;

import '../model/prevision.dart';

class ChampionshipMiddleware {
  static void fetchChampionshipMiddleware(
      Store<AppState> store, action, NextDispatcher next) {
    if (action is GetChampionshipAction) {
      ChampionshipMiddleware.getChampionship(store.state.authState.token)
          .then((championshipList) {
        if (championshipList != null && championshipList.statusCode == "200") {
          store.dispatch(
              GetChampionshipActionSuccess(championshipList: championshipList));
          // action.onSuccess();
        } else {
          // store.dispatch(LoginOnlineActionFailure(loginInfo: loginInfo!));
        }
      }).catchError((onError) {});
    }

    if (action is GetChampionshipMatchListAction) {
      ChampionshipMiddleware.getChampionshipMatchList(
              store.state.authState.token,
              action.championshipId,
              action.seasonId)
          .then((matchList) {
        if (matchList != null && matchList.statusCode == "200") {
          store.dispatch(
              GetChampionshipMatchListActionSucces(matchList: matchList));
          // action.onSuccess();
        } else {
          // store.dispatch(LoginOnlineActionFailure(loginInfo: loginInfo!));
        }
      }).catchError((onError) {});
    }

    if (action is GetMatchPrevisionListAction) {
      ChampionshipMiddleware.getChampionshipMatchPrevision(
              store.state.authState.token,
              action.championshipId,
              action.matchday,
              action.seasonId)
          .then((prevList) {
        if (prevList != null && prevList.statusCode == "200") {
          store.dispatch(GetMatchPrevisionListActionSucces(prevList: prevList));
          // action.onSuccess();
        } else {
          // store.dispatch(LoginOnlineActionFailure(loginInfo: loginInfo!));
        }
      }).catchError((onError) {});
    }


    if (action is SelectChampionshipAction) {
      action.onSuccess();
    }
    next(action);
  }

  static Future<MatchList?> getChampionshipMatchList(
      token, championshipId, seasonId) async {
    String url = 'http://localhost:8080/api/v2/standing/matchList/' +
        championshipId.toString() +
        '/' +
        seasonId.toString() +
        '';
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<MatchItem> lstMatch =
          List<MatchItem>.from(l.map((model) => MatchItem.fromJson(model)));

      MatchList matchList = MatchList(
          lstMatch: lstMatch, statusCode: response.statusCode.toString());
      return matchList;
    }
  }

  static Future<ChampionshipList?> getChampionship(token) async {
    Championship championship;
    http.Response response = await http.get(
        Uri.parse(
            'http://localhost:8080/api/v2/standing/retrieveCompetitionList'),
        headers: {
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Championship> lstchamp = List<Championship>.from(
          l.map((model) => Championship.fromJson(model)));
      ChampionshipList cmpList = ChampionshipList(
          lstChampionship: lstchamp,
          statusCode: response.statusCode.toString());
      return cmpList;
    }
  }

  static Future<PrevisionList?> getChampionshipMatchPrevision(
      token, championshipId, matchday, seasonId) async {
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
}
