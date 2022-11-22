import 'dart:convert';

import 'models.dart';

class GameIndex {
  GameIndex({
    required this.gameIndex,
    this.version,
  });

  int gameIndex;
  Species? version;

  factory GameIndex.fromJson(String str) => GameIndex.fromMap(json.decode(str));

  factory GameIndex.fromMap(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        version: Species.fromMap(json["version"]),
      );
}
