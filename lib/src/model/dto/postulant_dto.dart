// To parse this JSON data, do
//
//     final postulantDto = postulantDtoFromJson(jsonString);

import 'dart:convert';

PostulantDto disabilityDtoFromJson(String str) => PostulantDto.fromJson(json.decode(str));

String disabilityDtoToJson(PostulantDto data) => json.encode(data.toJson());

class PostulantDto {
  PostulantDto({
    this.id = "",
    this.address = "",
    this.birthDate = "",
    this.disabilityId = "",
    this.documentTypeId = "",
    this.email = "",
    this.genre = "",
    this.lastnameFather = "",
    this.lastnameMother = "",
    this.maritalStatus = "",
    this.names = "",
    this.phoneNumber = "",
  });

  String id;
  String address;
  String birthDate;
  String disabilityId;
  String documentTypeId;
  String email;
  String genre;
  String lastnameFather;
  String lastnameMother;
  String maritalStatus;
  String names;
  String phoneNumber;

  factory PostulantDto.fromJson(Map<String, dynamic> json) => PostulantDto(
        id: json["id"],
        address: json["address"],
        birthDate: json["birth_date"],
        disabilityId: json["disability_id"],
        documentTypeId: json["document_type_id"],
        email: json["email"],
        genre: json["genre"],
        lastnameFather: json["lastname_father"],
        lastnameMother: json["lastname_mother"],
        maritalStatus: json["marital_status"],
        names: json["names"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "birth_date": birthDate,
        "disability_id": disabilityId,
        "document_type_id": documentTypeId,
        "email": email,
        "genre": genre,
        "lastname_father": lastnameFather,
        "lastname_mother": lastnameMother,
        "marital_status": maritalStatus,
        "names": names,
        "phone_number": phoneNumber,
      };
}
