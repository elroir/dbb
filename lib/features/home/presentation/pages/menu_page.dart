import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ListTile(
            title: Text('Preguntas frecuentes')
          ),
          ListTile(
              title: Text(AppLocalizations.of(context)!.language)
          )
        ],
      ),
    );
  }
}
