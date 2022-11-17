// To parse this JSON data, do
//
//     final postulateAreaDto = postulateAreaDtoFromJson(jsonString);

import 'dart:convert';

PostulateAreaDto postulateAreaDtoFromJson(String str) => PostulateAreaDto.fromJson(json.decode(str));

String postulateAreaDtoToJson(PostulateAreaDto data) => json.encode(data.toJson());

class PostulateAreaDto {
  PostulateAreaDto({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory PostulateAreaDto.fromJson(Map<String, dynamic> json) => PostulateAreaDto(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
