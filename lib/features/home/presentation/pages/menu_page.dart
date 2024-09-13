import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ListTile(
            title: Text('Preguntas frecuentes')
          ),
          ListTile(
              title: Text('Idioma')
          )
        ],
      ),
    );
  }
}
