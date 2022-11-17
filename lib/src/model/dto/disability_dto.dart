// To parse this JSON data, do
//
//     final disabilityDto = disabilityDtoFromJson(jsonString);

// To parse this JSON data, do
//
//     final disabilityDto = disabilityDtoFromJson(jsonString);

import 'dart:convert';

DisabilityDto disabilityDtoFromJson(String str) => DisabilityDto.fromJson(json.decode(str));

String disabilityDtoToJson(DisabilityDto data) => json.encode(data.toJson());

class DisabilityDto {
  DisabilityDto({
    this.id = "",
    this.name = "",
  });

  final String id;
  final String name;

  factory DisabilityDto.fromJson(Map<String, dynamic> json) => DisabilityDto(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    return 'DisabilityDto{id: $id, name: $name}';
  }
}
