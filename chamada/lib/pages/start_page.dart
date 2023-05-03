import 'package:chamada/pages/menu_page.dart';
import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  final myGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF0D0D0D),
      Color(0xFFF2CB05),
    ],
  );

  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: myGradient,
        ),
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuPage(),
                ),
              );
            },
            child: const Text(
              'Chamada',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
