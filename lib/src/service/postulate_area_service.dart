import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:system_register_cbo/src/model/dto/postulate_area_dto.dart';

class PostulateAreaService {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('postulate_area');

  static Future<bool> exists(String id) async {
    final docRef = _collection.doc(id.trim());
    final doc = await docRef.get();
    return doc.exists;
  }

  static Stream<List<PostulateAreaDto>> listAreas = _collection
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) => PostulateAreaDto.fromJson(doc.data())).toList());
}
