// To parse this JSON data, do
//
//     final documentTypeDto = documentTypeDtoFromJson(jsonString);

import 'dart:convert';

DocumentTypeDto documentTypeDtoFromJson(String str) => DocumentTypeDto.fromJson(json.decode(str));

String documentTypeDtoToJson(DocumentTypeDto data) => json.encode(data.toJson());

class DocumentTypeDto {
  DocumentTypeDto({
    this.id = "",
    this.name = "",
    this.number = 0,
  });

  String name;
  String id;
  int number;

  factory DocumentTypeDto.fromJson(Map<String, dynamic> json) => DocumentTypeDto(
        name: json["name"],
        id: json["id"],
        number: json["number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "number": number,
      };

  @override
  String toString() {
    return 'DocumentTypeDto{name: $name, id: $id, number: $number}';
  }
}
