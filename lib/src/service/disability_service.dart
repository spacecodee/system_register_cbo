import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:system_register_cbo/src/model/dto/disability_dto.dart';

class DisabilityService {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('disability');

  static Stream<List<DisabilityDto>> listDisability = _collection
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => DisabilityDto.fromJson(doc.data())).toList());

  static Future<bool> exists(String id) async {
    bool exists = false;
    await _collection.doc(id).get().then((value) {
      exists = value.exists;
    });

    return exists;
  }

  static Future<String> getIdByName(String name) async {
    String id = '';
    await _collection.where('name', isEqualTo: name).get().then((value) {
      id = value.docs.first.id;
    });

    return id;
  }
}
