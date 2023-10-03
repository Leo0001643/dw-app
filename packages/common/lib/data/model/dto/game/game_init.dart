class GameInitDto {
  String? gameTagPatch;
  int? test;
  String? gameVal;

  GameInitDto({this.gameTagPatch, this.test, this.gameVal});

  GameInitDto.fromJson(Map<String, dynamic> json) {
    gameTagPatch = json['gameTagPatch'];
    test = json['test'];
    gameVal = json['gameVal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gameTagPatch'] = gameTagPatch;
    data['test'] = test;
    data['gameVal'] = gameVal;
    return data;
  }
}
