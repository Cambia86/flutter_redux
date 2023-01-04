
class ChampionshipList{
  List<Championship> lstChampionship;
  String? statusCode;

 ChampionshipList(
      {required this.lstChampionship,required this.statusCode});


}


class CurrentSeason{
  int id;
int currentMatchday;
CurrentSeason({required this.id,required this.currentMatchday});
factory CurrentSeason.fromJson (Map<String,dynamic>json){
      return CurrentSeason(
          id: json['id'],
          currentMatchday: json['currentMatchday'],
         );
    }
}

class Championship {
  int id;
  String name;
  String code;
  String emblemUrl;
  CurrentSeason currentSeason;


  Championship(
      {required this.id,required this.name,required this.code,required this.emblemUrl,required this.currentSeason});

  factory Championship.fromJson(Map<String, dynamic> json) {
    return Championship(id: json['id'], name: json['name'], code: json['code'], emblemUrl: json['emblemUrl'], currentSeason: CurrentSeason.fromJson(json['currentSeason']));
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'emblemUrl': emblemUrl,
      'currentSeason': currentSeason
    };
  }
}
