import 'package:cloud_firestore/cloud_firestore.dart';

class PostulateAreaService {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('postulate_area');

  static Future<bool> exists(String id) async {
    bool exists = false;
    await _collection.doc(id).get().then((value) {
      exists = value.exists;
    });

    return exists;
  }
}
