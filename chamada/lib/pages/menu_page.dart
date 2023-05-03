import 'package:chamada/pages/alunos_page.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int _selectedIndex = 0;

  final _pageOptions = [
    const AlunosPage(
      alunos: [],
    ),
    const AulasPage(),
    const ChamadaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: _pageOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Alunos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Aulas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Chamada',
          ),
        ],
      ),
    );
  }
}

class AulasPage extends StatelessWidget {
  const AulasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Aulas'),
    );
  }
}

class ChamadaPage extends StatelessWidget {
  const ChamadaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Chamada'),
    );
  }
}
