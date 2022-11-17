import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:system_register_cbo/src/model/dto/postulant_dto.dart';
import 'package:system_register_cbo/src/model/vo/postulant_vo.dart';
import 'package:system_register_cbo/src/service/disability_service.dart';
import 'package:system_register_cbo/src/service/document_type_service.dart';

class PostulateService {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('postulant');

  static Future<String> add(PostulanteVo vo) async {
    if (vo.disabilityId.isEmpty) {
      return "";
    }

    final disability = await DisabilityService.exists(vo.disabilityId);
    if (!disability) {
      return "";
    }

    final documentType = await DocumentTypeService.add(vo.documentTypeId);

    PostulantDto dto = PostulantDto();
    dto.documentTypeId = documentType;
    dto.disabilityId = vo.disabilityId;
    dto.names = vo.names;
    dto.lastnameFather = vo.lastnameFather;
    dto.lastnameMother = vo.lastnameMother;
    dto.birthDate = vo.birthDate;
    dto.address = vo.address;
    dto.email = vo.email;
    dto.genre = vo.genre;
    dto.maritalStatus = vo.maritalStatus;
    dto.phoneNumber = vo.phoneNumber;

    final uid = _collection.doc().id;
    dto.id = uid;
    final docRef = _collection.doc(uid);

    try {
      await docRef.set(dto.toJson());
      return uid;
    } catch (e) {
      return "";
    }
  }
}
