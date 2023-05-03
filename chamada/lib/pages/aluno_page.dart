import 'package:chamada/database/aluno_dao.dart';
import 'package:chamada/models/aluno_model.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AlunoPage extends StatefulWidget {
  final AlunoModel? aluno;
  const AlunoPage({super.key, this.aluno});

  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _telefoneController = TextEditingController();
  MaskTextInputFormatter telefoneMask = MaskTextInputFormatter(
    mask: '(00) 00000-0000',
    filter: {'0': RegExp(r'[0-9]')},
  );
  final _cpfController = TextEditingController();
  MaskTextInputFormatter cpfMask = MaskTextInputFormatter(
    mask: '000.000.000-00',
    filter: {'0': RegExp(r'[0-9]')},
  );
  final _rgController = TextEditingController();
  MaskTextInputFormatter rgMask = MaskTextInputFormatter(
    mask: '00.000.000-0',
    filter: {'0': RegExp(r'[0-9]'), 'a': RegExp(r'[a-zA-Z]')},
  );
  final _dataNascimentoController = TextEditingController();
  final _sexoController = TextEditingController();

  final _dao = AlunoDao();
  final items = const [
    DropdownMenuItem(
      value: 'Masculino',
      child: Text('Masculino'),
    ),
    DropdownMenuItem(
      value: 'Feminino',
      child: Text('Feminino'),
    ),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.aluno != null) {
      _nameController.text = widget.aluno!.name!;
      _telefoneController.text = widget.aluno!.telefone!;
      _cpfController.text = widget.aluno!.cpf!;
      _rgController.text = widget.aluno!.rg!;
      _dataNascimentoController.text = widget.aluno!.dataNascimento!;
      _sexoController.text = widget.aluno!.sexo!;
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final aluno = AlunoModel(
        widget.aluno?.id,
        _nameController.text,
        _telefoneController.text,
        _cpfController.text,
        _rgController.text,
        _dataNascimentoController.text,
        _sexoController.text,
      );

      if (widget.aluno != null) {
        await _dao.update(aluno);
      } else {
        await _dao.save(aluno);
      }

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o nome';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _telefoneController,
                    inputFormatters: [telefoneMask],
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o telefone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _cpfController,
                    inputFormatters: [
                      cpfMask,
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CPF',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o CPF';
                      } else if (!validarCPF(value)) {
                        return 'CPF inválido';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _rgController,
                    inputFormatters: [rgMask],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'RG',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o RG';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    controller: _dataNascimentoController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Data de Nascimento',
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a data de nascimento';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  DropdownButtonFormField<String>(
                      value: items.first.value,
                      onChanged: (value) {
                        setState(() {
                          _sexoController.text = value!;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Sexo',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, selecione o sexo';
                        }
                        return null;
                      },
                      items: items),
                  const SizedBox(height: 28.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                      ),
                      child: const Text(
                        'Salvar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validarCPF(String cpf) {
    if (cpf.isEmpty) return false;

    String cleanCPF = cpf.replaceAll(RegExp(r'[^\d]+'), '');
    if (cleanCPF.length != 11) return false;

    List<int> numbers = cleanCPF.split('').map(int.parse).toList();
    List<int> digits = numbers.sublist(0, 9);
    digits.addAll([0, 0]);

    for (int i = 0; i < 2; i++) {
      int sum = digits.fold<int>(0, (accumulator, currentValue) => accumulator + currentValue * ((9 + i) - digits.indexOf(currentValue)));
      int mod = sum % 11;
      digits[9 + i] = (mod < 2 ? 0 : 11 - mod);
    }

    return List.generate(11, (index) => digits[0]).join() == cleanCPF;
  }
}
