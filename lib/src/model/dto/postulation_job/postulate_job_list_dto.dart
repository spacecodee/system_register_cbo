// To parse this JSON data, do
//
//     final postulateJobListDto = postulateJobListDtoFromJson(jsonString);

import 'dart:convert';

PostulateJobListDto postulateJobListDtoFromJson(String str) => PostulateJobListDto.fromJson(json.decode(str));

String postulateJobListDtoToJson(PostulateJobListDto data) => json.encode(data.toJson());

class PostulateJobListDto {
  PostulateJobListDto({
    this.postulateId = '',
    this.strengthsAbilities = '',
    this.postulateArea = '',
  });

  late final String postulateId;
  final String strengthsAbilities;
  final String postulateArea;

  factory PostulateJobListDto.fromJson(Map<String, dynamic> json) => PostulateJobListDto(
        postulateId: json["postulate_id"],
        strengthsAbilities: json["strengths_abilities"],
        postulateArea: json["postulate_area"],
      );

  Map<String, dynamic> toJson() => {
        "postulate_id": postulateId,
        "strengths_abilities": strengthsAbilities,
        "postulate_area": postulateArea,
      };
}
