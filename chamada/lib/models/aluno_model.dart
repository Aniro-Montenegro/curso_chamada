class AlunoModel {
  int? id;
  String? name;
  String? telefone;
  String? cpf;
  String? rg;
  String? dataNascimento;
  String? sexo;

  AlunoModel(this.id, this.name, this.telefone, this.cpf, this.rg, this.dataNascimento, this.sexo);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'telefone': telefone,
        'cpf': cpf,
        'rg': rg,
        'dataNascimento': dataNascimento,
        'sexo': sexo,
      };

  factory AlunoModel.fromJson(Map<String, dynamic> json) => AlunoModel(
        json['id'] as int?,
        json['name'] as String?,
        json['telefone'] as String?,
        json['cpf'] as String?,
        json['rg'] as String?,
        json['dataNascimento'] as String?,
        json['sexo'] as String?,
      );
}
