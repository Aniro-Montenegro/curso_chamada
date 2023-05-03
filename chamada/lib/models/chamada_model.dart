import 'package:chamada/models/aluno_model.dart';

class Chamada {
  int? id;
  String? presentes;
  String? ausentes;
  int? idAula;

  Chamada(this.id, this.presentes, this.ausentes, this.idAula);

  Map<String, dynamic> toJson() => {
        'id': id,
        'presentes': presentes,
        'ausentes': ausentes,
        'idAula': idAula,
      };

  factory Chamada.fromJson(Map<String, dynamic> json) => Chamada(json['id'], json['presentes'], json['ausentes'], json['idAula']);

  // Função que recebe uma lista de AlunoModel e retorna uma String com os dados separados por vírgula
  static String listaAlunosParaString(List<AlunoModel> alunos) {
    String lista = '';
    for (var aluno in alunos) {
      lista += '${aluno.id};${aluno.name};${aluno.telefone};${aluno.cpf};${aluno.rg};${aluno.dataNascimento};${aluno.sexo},';
    }
    return lista.substring(0, lista.length - 1);
  }

  // Função que recebe uma String com os dados dos alunos separados por vírgula e retorna uma lista de AlunoModel
  static List<AlunoModel> stringParaListaAlunos(String lista) {
    List<AlunoModel> alunos = [];
    List<String> dadosAlunos = lista.split(',');
    for (var dados in dadosAlunos) {
      List<String> dadosSeparados = dados.split(';');
      AlunoModel aluno = AlunoModel(
        int.parse(dadosSeparados[0]),
        dadosSeparados[1],
        dadosSeparados[2],
        dadosSeparados[3],
        dadosSeparados[4],
        dadosSeparados[5],
        dadosSeparados[6],
      );
      alunos.add(aluno);
    }
    return alunos;
  }

  // Função que recebe uma lista de AlunoModel e atribui seus dados à variável presentes
  void setPresentes(List<AlunoModel> alunos) {
    presentes = listaAlunosParaString(alunos);
  }

  // Função que recebe uma lista de AlunoModel e atribui seus dados à variável ausentes
  void setAusentes(List<AlunoModel> alunos) {
    ausentes = listaAlunosParaString(alunos);
  }

  // Função que retorna uma lista de AlunoModel com os dados da variável presentes
  List<AlunoModel> getPresentes() {
    if (presentes == null || presentes!.isEmpty) {
      return [];
    }
    return stringParaListaAlunos(presentes!);
  }

  // Função que retorna uma lista de AlunoModel com os dados da variável ausentes
  List<AlunoModel> getAusentes() {
    if (ausentes == null || ausentes!.isEmpty) {
      return [];
    }
    return stringParaListaAlunos(ausentes!);
  }
}
