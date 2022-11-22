import 'dart:convert';

import 'models.dart';

class Move {
  Move({
    required this.move,
    this.versionGroupDetails,
  });

  Species move;
  List<VersionGroupDetail>? versionGroupDetails;

  factory Move.fromJson(String str) => Move.fromMap(json.decode(str));

  factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: Species.fromMap(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromMap(x))),
      );
}
