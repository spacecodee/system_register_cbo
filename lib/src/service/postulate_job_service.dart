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

  static Future<List<PostulateJobListDto>> lista() async {
    List<PostulateJobListDto> list = [];

    final jobs = await _collectionJob.get();
    final postulantes = await _collectionPostulante.get();
    final areas = await _collectionArea.get();

    for (var job in jobs.docs) {
      for (var postulante in postulantes.docs) {
        for (var area in areas.docs) {
          if (area['id'].toString().contains(job['postulate_area'])) {
            if (postulante['id'].toString().contains(job['postulate_id'])) {
              list.add(PostulateJobListDto(
                postulateId: postulante['names'],
                strengthsAbilities: job['strengths_abilities'],
                postulateArea: area['name'],
              ));
            }
          }
        }
      }
    }

    return list;
  }

  static Future<bool> existByPostulantId(String id) {
    return _collectionJob.where('postulate_id', isEqualTo: id).get().then((value) => value.docs.isNotEmpty);
  }

  static Future<bool> add(PostulateJobVo vo) async {
    final alreadyExist = await existByPostulantId(vo.postulateId);
    if (alreadyExist) {
      return false;
    }

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
}
