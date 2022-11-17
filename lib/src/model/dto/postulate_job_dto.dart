// To parse this JSON data, do
//
//     final postulateJobDto = postulateJobDtoFromJson(jsonString);

import 'dart:convert';

PostulateJobDto postulateJobDtoFromJson(String str) => PostulateJobDto.fromJson(json.decode(str));

String postulateJobDtoToJson(PostulateJobDto data) => json.encode(data.toJson());

class PostulateJobDto {
  PostulateJobDto({
    this.postulateArea = "",
    this.postulateId = "",
    this.strengthsAbilities = "",
  });

  String postulateArea;
  String postulateId;
  String strengthsAbilities;

  factory PostulateJobDto.fromJson(Map<String, dynamic> json) => PostulateJobDto(
        postulateArea: json["postulate_area"],
        postulateId: json["postulate_id"],
        strengthsAbilities: json["strengths_abilities"],
      );

  Map<String, dynamic> toJson() => {
        "postulate_area": postulateArea,
        "postulate_id": postulateId,
        "strengths_abilities": strengthsAbilities,
      };
}
