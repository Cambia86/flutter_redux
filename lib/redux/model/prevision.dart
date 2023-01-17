import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_redux_project/redux/model/MatchList.dart';

class PrevisionList {
  List<Prevision> lstPrevision;
  String statusCode;

  PrevisionList({required this.lstPrevision, required this.statusCode});
}

class PercentPrevision {
  double winHome;
  double draw;
  double winAway;
  double winHomePerc;
  double drawPerc;
  double winAwayPerc;
  bool winHomeSelected=false;
  bool drawSelected=false;
  bool winAwaySelected=false;

  PercentPrevision(
      {required this.winHome,
      required this.draw,
      required this.winAway,
      required this.winHomePerc,
      required this.drawPerc,
      required this.winAwayPerc});

  factory PercentPrevision.fromJson(Map<String, dynamic> json) {
    return PercentPrevision(
      winHome: (double.tryParse(json['winHome'].toString()) ?? 0),
      winAway: (double.tryParse(json['winAway'].toString()) ?? 0),
      draw: (double.tryParse(json['draw'].toString()) ?? 0),
      winHomePerc: (double.tryParse(json['winHomePerc'].toString()) ?? 0),
      drawPerc: (double.tryParse(json['drawPerc'].toString()) ?? 0),
      winAwayPerc: (double.tryParse(json['winAwayPerc'].toString()) ?? 0),
    );
  }
}

class ValuePerc {
  double quota;
  double quotaPerc;
  bool isSelected=false;

  ValuePerc({required this.quota, required this.quotaPerc});

  factory ValuePerc.fromJson(Map<String, dynamic> json) {
    return ValuePerc(
      quota: (double.tryParse(json['quota'].toString()) ?? 0),
      quotaPerc: (double.tryParse(json['quotaPerc'].toString()) ?? 0),
    );
  }
}

class Prevision {
  // int id;
  String id;
  Team homeTeam;
  Team awayTeam;
  int competitionId;
  int seasonId;
  int matchDay;
  String matchDate;
  double winHome;
  double winAway;
  double draw;
  PercentPrevision allMatch;
  ValuePerc goal;
  ValuePerc noGoal;

  ValuePerc over_15;
  ValuePerc under_15;
  ValuePerc over_25;
  ValuePerc under_25;
  ValuePerc under_35;
  ValuePerc over_35;

  ValuePerc goal_1_3;
  ValuePerc goal_1_4;
  ValuePerc goal_1_5;
  ValuePerc goal_2_4;
  ValuePerc goal_2_5;
  ValuePerc goal_3_6;

  ValuePerc goal_1_3_casa;
  ValuePerc goal_1_4_casa;
  ValuePerc goal_2_4_casa;
  ValuePerc goal_1_3_ospite;
  ValuePerc goal_1_4_ospite;
  ValuePerc goal_2_4_ospite;

  Score score;

  bool isSelected = false;

  Prevision(
      {required this.id,
      required this.homeTeam,
      required this.awayTeam,
      required this.competitionId,
      required this.seasonId,
      required this.matchDay,
      required this.matchDate,
      required this.winHome,
      required this.winAway,
      required this.draw,
      required this.allMatch,
      required this.goal,
      required this.noGoal,
      required this.over_15,
      required this.under_15,
      required this.over_25,
      required this.under_25,
      required this.under_35,
      required this.over_35,
      required this.goal_1_3,
      required this.goal_1_4,
      required this.goal_1_5,
      required this.goal_2_4,
      required this.goal_2_5,
      required this.goal_3_6,
      required this.goal_1_3_casa,
      required this.goal_1_4_casa,
      required this.goal_2_4_casa,
      required this.goal_1_3_ospite,
      required this.goal_1_4_ospite,
      required this.goal_2_4_ospite,
      required this.score});

  factory Prevision.fromJson(Map<String, dynamic> json) {
    return Prevision(
        id: json['_id'],
        homeTeam: Team.fromJson(json['homeTeam']),
        awayTeam: Team.fromJson(json['awayTeam']),
        competitionId: json['competitionId'],
        seasonId: json['seasonId'],
        matchDay: json['matchDay'],
        matchDate: json['matchDate'],
        winHome: (double.tryParse(json['winHome'].toString()) ?? 0),
        winAway: (double.tryParse(json['winAway'].toString()) ?? 0),
        draw: (double.tryParse(json['draw'].toString()) ?? 0),
        allMatch: PercentPrevision.fromJson(json['allMatch']),
        goal: ValuePerc.fromJson(json['goal']),
        noGoal: ValuePerc.fromJson(json['no_goal']),
        over_15: ValuePerc.fromJson(json['over_15']),
        under_15: ValuePerc.fromJson(json['under_15']),
        over_25: ValuePerc.fromJson(json['over_25']),
        under_25: ValuePerc.fromJson(json['under_25']),
        under_35: ValuePerc.fromJson(json['under_35']),
        over_35: ValuePerc.fromJson(json['over_35']),
        goal_1_3: ValuePerc.fromJson(json['goal_1_3']),
        goal_1_4: ValuePerc.fromJson(json['goal_1_4']),
        goal_1_5: ValuePerc.fromJson(json['goal_1_5']),
        goal_2_4: ValuePerc.fromJson(json['goal_2_4']),
        goal_2_5: ValuePerc.fromJson(json['goal_2_5']),
        goal_3_6: ValuePerc.fromJson(json['goal_3_6']),
        goal_1_3_casa: ValuePerc.fromJson(json['goal_1_3_casa']),
        goal_1_4_casa: ValuePerc.fromJson(json['goal_1_4_casa']),
        goal_2_4_casa: ValuePerc.fromJson(json['goal_2_4_casa']),
        goal_1_3_ospite: ValuePerc.fromJson(json['goal_1_3_ospite']),
        goal_1_4_ospite: ValuePerc.fromJson(json['goal_1_4_ospite']),
        goal_2_4_ospite: ValuePerc.fromJson(json['goal_2_4_ospite']),
        score: Score.fromJson(json['score'])
        // emblemUrl: json['emblemUrl'],
        );
  }

  Map<String, dynamic> toMap() {
    return {
      // 'id': id,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
      // 'name': name,
      // 'code': code,
      // 'emblemUrl': emblemUrl,
      // 'currentSeason': currentSeason
    };
  }
}
