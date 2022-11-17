import 'package:system_register_cbo/src/model/vo/postulant_vo.dart';

class PostulateJobVo {
  PostulateJobVo({
    required this.postulateArea,
    required this.postulateId,
    required this.strengthsAbilities,
  });

  final String postulateArea;
  final PostulanteVo postulateId;
  final String strengthsAbilities;
}
