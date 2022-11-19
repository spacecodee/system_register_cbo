import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:system_register_cbo/src/model/dto/postulation_job/postulate_job_dto.dart';
import 'package:system_register_cbo/src/model/dto/postulation_job/postulate_job_list_dto.dart';
import 'package:system_register_cbo/src/model/vo/postulate_job_vo.dart';
import 'package:system_register_cbo/src/service/postulate_area_service.dart';
import 'package:system_register_cbo/src/service/postulate_service.dart';

class PostulateJobService {
  static final _instance = FirebaseFirestore.instance;
  static final _collectionJob = _instance.collection('postulate_job');
  static final _collectionPostulante = _instance.collection('postulant');
  static final _collectionArea = _instance.collection('postulate_area');

  static Future<bool> add(PostulateJobVo vo) async {
    final areaExist = await PostulateAreaService.exists(vo.postulateArea);
    if (!areaExist) {
      return false;
    }

    final postulateId = await PostulateService.existById(vo.postulateId);
    if (!postulateId) {
      return false;
    }

    PostulateJobDto dto = PostulateJobDto();
    dto.postulateArea = vo.postulateArea.toString().trim();
    dto.postulateId = vo.postulateId.toString().trim();
    dto.strengthsAbilities = vo.strengthsAbilities;

    try {
      await _collectionJob.doc().set(dto.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  static Stream<List<PostulateJobListDto>> listAreas() {
    return _collectionJob
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PostulateJobListDto.fromJson(doc.data())).toList());
  }

  static Future<List<PostulateJobListDto>> lista() async {
    List<PostulateJobListDto> list = [];

    final jobs = await _collectionJob.get();
    final postulantes = await _collectionPostulante.get();
    final areas = await _collectionArea.get();

    for (var job in jobs.docs) {
      for (var postulante in postulantes.docs) {
        final postulate = PostulateJobListDto();
        final getSome = postulante.data().keys.where((element) => element == 'names');
        print('postulante: $getSome');
        //print(postulate);
      }
    }

    return list;
  }
}
