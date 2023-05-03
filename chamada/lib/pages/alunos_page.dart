import 'package:chamada/models/aluno_model.dart';
import 'package:chamada/models/alunos_provider.dart';
import 'package:chamada/pages/aluno_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlunosPage extends StatelessWidget {
  final List<AlunoModel> alunos;

  const AlunosPage({Key? key, required this.alunos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AlunoPage()),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<Alunos>(
                builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: alunos.length,
                    itemBuilder: (context, index) {
                      final aluno = alunos[index];
                      return ListTile(
                        title: Text(aluno.name ?? ''),
                        subtitle: Text('CPF: ${aluno.cpf ?? ''}\nTelefone: ${aluno.telefone ?? ''}'),
                        onTap: () {
                          // Faça algo quando o aluno for selecionado
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
