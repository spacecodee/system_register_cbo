class PostulateJobVo {
  PostulateJobVo({
    required this.postulateArea,
    required this.postulateId,
    required this.strengthsAbilities,
  });

  final String postulateArea;
  final String postulateId;
  final String strengthsAbilities;

  @override
  String toString() {
    return 'PostulateJobVo{postulateArea: $postulateArea, postulateId: $postulateId, strengthsAbilities: $strengthsAbilities}';
  }
}
