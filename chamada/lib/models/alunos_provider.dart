import 'package:chamada/database/aluno_dao.dart';
import 'package:chamada/models/aluno_model.dart';
import 'package:flutter/material.dart';

class Alunos extends ChangeNotifier {
  List<AlunoModel> alunos;
  Alunos({required this.alunos});

  void addAluno(AlunoModel alunoModel) {
    alunos.add(alunoModel);
    notifyListeners();
  }

  void saveAluno(AlunoModel alunoModel) {
    AlunoDao().save(alunoModel).then((value) {
      if (value == true) {
        addAluno(alunoModel);
      }
    });
  }
}
