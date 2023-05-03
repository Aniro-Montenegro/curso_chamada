import 'package:chamada/models/alunos_provider.dart';
import 'package:chamada/pages/start_page.dart';
import 'package:chamada/themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => Alunos(
                  alunos: [],
                ))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Chamada', theme: myTheme, home: const StartPage());
  }
}
