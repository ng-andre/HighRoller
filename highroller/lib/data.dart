class Player {
  String name;
  int chips;

  Player(this.name, this.chips);

  Player.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        chips = json['chips'] as int;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'name': name.toString(),
        'text': chips,
      };
}
