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
        winHomePerc:(double.tryParse(json['winHomePerc'].toString()) ?? 0),
        drawPerc:(double.tryParse(json['drawPerc'].toString()) ?? 0),
        winAwayPerc: (double.tryParse(json['winAwayPerc'].toString()) ?? 0),
       
        );
  }
}

class valuePerc{
  
}

class Prevision {
  // int id;
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

  Prevision(
      {
      // required this.id,
      required this.homeTeam,
      required this.awayTeam,
      required this.competitionId,
      required this.seasonId,
      required this.matchDay,
      required this.matchDate,
      required this.winHome,
      required this.winAway,
      required this.draw,
      required this.allMatch});

  factory Prevision.fromJson(Map<String, dynamic> json) {
    return Prevision(
        homeTeam: Team.fromJson(json['homeTeam']),
        awayTeam: Team.fromJson(json['awayTeam']),
        competitionId: json['competitionId'],
        seasonId: json['seasonId'],
        matchDay: json['matchDay'],
        matchDate: json['matchDate'],
        winHome: (double.tryParse(json['winHome'].toString()) ?? 0),
        winAway: (double.tryParse(json['winAway'].toString()) ?? 0),
        draw: (double.tryParse(json['draw'].toString()) ?? 0),
        allMatch: PercentPrevision.fromJson(json['allMatch'])
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
