class MatchList {
  List<MatchItem> lstMatch;
  String? statusCode;

  MatchList({required this.lstMatch, required this.statusCode});
}

class Team {
  int? id;
  String? name;

  Team({required this.id, required this.name});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(id: json['id'], name: json['name']);
  }
}

class Result {
  int? homeTeam;
  int? awayTeam;

  Result({required this.homeTeam, required this.awayTeam});

  factory Result.fromJson(Map<String, dynamic> json) {
    int? hteam = json['homeTeam'];
    int? ateam = json['awayTeam'];
    return Result(homeTeam: hteam, awayTeam: ateam);
  }
}

class Score {
  String? winner;
  Result? fullTime;
  Result? halfTime;

  Score({required this.winner, required this.fullTime, required this.halfTime});

  factory Score.fromJson(Map<String, dynamic> json) {
    Result ft = Result.fromJson(json['fullTime']);
    Result ht = Result.fromJson(json['halfTime']);
    return Score(winner: json['winner'], fullTime: ft, halfTime: ht);
  }
}

class MatchItem {
  int id;
  String? utcDate;
  int? matchday;
  Team? homeTeam;
  Team? awayTeam;
  Score? score;

  MatchItem({required this.id,required this.utcDate, required this.matchday, required this.homeTeam, required this.awayTeam, required this.score});

  factory MatchItem.fromJson(Map<String, dynamic> json) {
    int? matchday = json['matchday'];
    Score? score = Score.fromJson(json['score']);
    return MatchItem(
        id: json['id'],
        utcDate:json['utcDates'],
        matchday: matchday,
        homeTeam:Team.fromJson(json['homeTeam']),
        awayTeam:Team.fromJson(json['awayTeam']),
        score: score);
  }

  Map<String, dynamic> toMap() {
    return {'id': id};
  }
}
