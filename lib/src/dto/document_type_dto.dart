// To parse this JSON data, do
//
//     final documentTypeDto = documentTypeDtoFromJson(jsonString);

import 'dart:convert';

DocumentTypeDto documentTypeDtoFromJson(String str) => DocumentTypeDto.fromJson(json.decode(str));

String documentTypeDtoToJson(DocumentTypeDto data) => json.encode(data.toJson());

class DocumentTypeDto {
  DocumentTypeDto({
    required this.id,
    required this.name,
  });

  final String name;
  final String id;

  factory DocumentTypeDto.fromJson(Map<String, dynamic> json) => DocumentTypeDto(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
