import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:system_register_cbo/src/model/dto/postulate_job_dto.dart';
import 'package:system_register_cbo/src/model/vo/postulate_job_vo.dart';
import 'package:system_register_cbo/src/service/postulate_area_service.dart';
import 'package:system_register_cbo/src/service/postulate_service.dart';

class PostulateJobService {
  static final _instance = FirebaseFirestore.instance;
  static final _collection = _instance.collection('postulate_job');

  static Future<bool> add(PostulateJobVo vo) async {
    final areaExist = await PostulateAreaService.exists(vo.postulateArea);

    if (!areaExist) {
      return false;
    }

    final postulateId = await PostulateService.add(vo.postulateId);
    if (postulateId == "") {
      return false;
    }

    PostulateJobDto dto = PostulateJobDto();
    dto.postulateArea = vo.postulateArea;
    dto.postulateId = postulateId;
    dto.strengthsAbilities = vo.strengthsAbilities;

    try {
      await _collection.doc().set(dto.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
