import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:system_register_cbo/src/model/dto/document_type_dto.dart';

class DocumentTypeService {
  static Future<String> add(DocumentTypeDto dto) async {
    final collection = FirebaseFirestore.instance.collection("document_type");

    if (dto.name.isEmpty || dto.number.isNegative) {
      return "";
    }
    final uid = collection.doc().id;
    dto.id = uid;
    final docRef = collection.doc(uid);

    try {
      await docRef.set(dto.toJson());
      return uid;
    } catch (e) {
      return "";
    }
  }
}
