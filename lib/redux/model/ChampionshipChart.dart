class ChampionshipChartList{
  List<ChampionshipChart> lstChampionshipChart;
  String? statusCode;

 ChampionshipChartList(
      {required this.lstChampionshipChart,required this.statusCode});
}



class ChampionshipChart {
  int id;
  String name;
  String code;
  String emblemUrl;
  // CurrentSeason currentSeason;


  ChampionshipChart(
      {required this.id,required this.name,required this.code,required this.emblemUrl});

  factory ChampionshipChart.fromJson(Map<String, dynamic> json) {
    return ChampionshipChart(id: json['id'], name: json['name'], code: json['code'], emblemUrl: json['emblemUrl']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'emblemUrl': emblemUrl
    };
  }
}
