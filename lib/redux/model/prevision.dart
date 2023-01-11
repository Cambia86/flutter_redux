import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter_redux_project/redux/model/MatchList.dart';

class PrevisionList {
  List<Prevision> lstPrevision;
  String statusCode;

  PrevisionList({required this.lstPrevision, required this.statusCode});
}

class PercentPrevision {
  Double winHome;
  Double draw;
  Double winAway;
  Double winHomePerc;
  Double drawPerc;
  Double winAwayPerc;

  PercentPrevision(
      {required this.winHome,
      required this.draw,
      required this.winAway,
      required this.winHomePerc,
      required this.drawPerc,
      required this.winAwayPerc});

  factory PercentPrevision.fromJson(Map<String, dynamic> json) {
    return PercentPrevision(
        winHome: json['winHome'],
        draw: json['draw'],
        winAway: json['winAway'],
        winHomePerc: json['winHomePerc'],
        drawPerc: json['drawPerc'],
        winAwayPerc: json['winAwayPerc']);
  }
}

class Prevision {
  int id;
  Team homeTeam;
  Team awayTeam;
  int competitionId;
  int seasonId;
  int matchDay;
  String matchDate;
  Double winHome;
  Double winAway;
  Double draw;
  PercentPrevision allMatch;

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
      required this.allMatch});

  factory Prevision.fromJson(Map<String, dynamic> json) {
    return Prevision(
        id: json['id'],
        homeTeam: Team.fromJson(json['homeTeam']),
        awayTeam: Team.fromJson(json['awayTeam']),
        competitionId: json['competitionId'],
        seasonId: json['seasonId'],
        matchDay: json['matchDay'],
        matchDate: json['matchDate'],
        winHome: json['winHome'],
        winAway: json['winAway'],
        draw: json['draw'],
        allMatch: PercentPrevision.fromJson(json['allMatch'])
        // emblemUrl: json['emblemUrl'],
        );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      // 'name': name,
      // 'code': code,
      // 'emblemUrl': emblemUrl,
      // 'currentSeason': currentSeason
    };
  }
}
