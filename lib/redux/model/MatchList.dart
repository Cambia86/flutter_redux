class MatchList{
  List<MatchItem> lstMatch;
  String? statusCode;

 MatchList(
      {required this.lstMatch,required this.statusCode});
}


class MatchItem{
  int id;

  MatchItem({required this.id,});

  factory MatchItem.fromJson(Map<String, dynamic> json) {
    return MatchItem(id: json['id']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id
    };
  }
}