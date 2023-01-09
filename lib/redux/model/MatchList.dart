class MatchList{
  List<MatchItem> lstMatch;
  String? statusCode;


 MatchList(
      {required this.lstMatch,required this.statusCode});
}

class Result{
  int? homeTeam;
  int? awayTeam;

  Result({required this.homeTeam, required this.awayTeam});

   factory Result.fromJson(Map<String, dynamic> json) {
     int? hteam= json['homeTeam'];
     int? ateam=json['awayTeam'];
    return Result(homeTeam: hteam,awayTeam:ateam);
  }
}

class Score{
  String? winner;
  Result? fullTime;
  Result? halfTime;
  
    Score({required this.winner, required this.fullTime,required this.halfTime});


     factory Score.fromJson(Map<String, dynamic> json) {
     Result ft= Result.fromJson(json['fullTime']);
     Result ht= Result.fromJson(json['halfTime']);
     return Score(winner: json['winner'] ,fullTime:ft,halfTime:ht);
     
  }
}


class MatchItem{
  int id;
  DateTime? utcDate;
  int? matchday;
  Score? score;

  MatchItem({required this.id,required this.matchday,required this.score});

  factory MatchItem.fromJson(Map<String, dynamic> json) {
    int? matchday= json['matchday'];
    Score? score=Score.fromJson(json['score']);
    return MatchItem(id: json['id']
              // ,utcDate:DateTime.parse(json['utcDates'])
              ,matchday:matchday,
             score: score);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id
      
    };
  }
}