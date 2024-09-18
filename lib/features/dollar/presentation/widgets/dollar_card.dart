import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/updated_text.dart';
import '../../domain/entities/dollar.dart';

class DollarCard extends StatelessWidget {
  final Dollar dollar;
  const DollarCard({super.key, required this.dollar});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(dollar.name),
          UpdatedText(dateTime: dollar.lastUpdate)
        ],
      ),
    );
  }
}
