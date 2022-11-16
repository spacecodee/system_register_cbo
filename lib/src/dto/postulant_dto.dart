// To parse this JSON data, do
//
//     final postulantDto = postulantDtoFromJson(jsonString);

import 'dart:convert';

PostulantDto postulantDtoFromJson(String str) => PostulantDto.fromJson(json.decode(str));

String postulantDtoToJson(PostulantDto data) => json.encode(data.toJson());

class PostulantDto {
  PostulantDto({
    required this.id,
    required this.address,
    required this.birthDate,
    required this.email,
    required this.genre,
    required this.lastnameFather,
    required this.lastnameMother,
    required this.maritalStatus,
    required this.names,
    required this.phoneNumber,
    required this.documentId,
  });

  final String id;
  final String address;
  final String birthDate;
  final String email;
  final String genre;
  final String lastnameFather;
  final String lastnameMother;
  final String maritalStatus;
  final String names;
  final int phoneNumber;
  final String documentId;

  factory PostulantDto.fromJson(Map<String, dynamic> json) => PostulantDto(
        id: json["id"],
        address: json["address"],
        birthDate: json["birth_date"],
        email: json["email"],
        genre: json["genre"],
        lastnameFather: json["lastname_father"],
        lastnameMother: json["lastname_mother"],
        maritalStatus: json["marital_status"],
        names: json["names"],
        phoneNumber: json["phone_number"],
        documentId: json["documentId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "birth_date": birthDate,
        "email": email,
        "genre": genre,
        "lastname_father": lastnameFather,
        "lastname_mother": lastnameMother,
        "marital_status": maritalStatus,
        "names": names,
        "phone_number": phoneNumber,
        "documentId": documentId,
      };
}
