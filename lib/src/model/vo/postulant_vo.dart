// To parse this JSON data, do
//
//     final postulantDto = postulantDtoFromJson(jsonString);

import 'package:system_register_cbo/src/model/dto/document_type_dto.dart';

class PostulanteVo {
  PostulanteVo({
    this.id = "",
    this.address = "",
    this.birthDate = "",
    this.disabilityId = "",
    required this.documentTypeId,
    this.email = "",
    this.genre = "",
    this.lastnameFather = "",
    this.lastnameMother = "",
    this.maritalStatus = "",
    this.names = "",
    this.phoneNumber = "",
  });

  late String id;
  final String address;
  final String birthDate;
  final String disabilityId;
  final DocumentTypeDto documentTypeId;
  final String email;
  final String genre;
  final String lastnameFather;
  final String lastnameMother;
  final String maritalStatus;
  final String names;
  final String phoneNumber;

  @override
  String toString() {
    return 'PostulanteVo{id: $id, address: $address, birthDate: $birthDate, disabilityId: $disabilityId, documentTypeId: $documentTypeId, email: $email, genre: $genre, lastnameFather: $lastnameFather, lastnameMother: $lastnameMother, maritalStatus: $maritalStatus, names: $names, phoneNumber: $phoneNumber}';
  }
}
