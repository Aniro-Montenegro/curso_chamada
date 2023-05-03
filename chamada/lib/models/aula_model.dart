class AulaModel {
  int? id;
  String? tema;
  int? professorId;
  String? data;

  AulaModel(this.id, this.tema, this.professorId, this.data);

  Map<String, dynamic> toJson() => {
        'id': id,
        'tema': tema,
        'professorId': professorId,
        'data': data,
      };

  factory AulaModel.fromJson(Map<String, dynamic> json) => AulaModel(
        json['id'] as int?,
        json['tema'] as String?,
        json['professorId'] as int?,
        json['data'] as String?,
      );
}
