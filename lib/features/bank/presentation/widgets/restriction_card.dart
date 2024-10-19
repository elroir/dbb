import 'package:flutter/material.dart';

import '../../domain/entities/bank_restriction.dart';

class RestrictionCard extends StatelessWidget {
  final BankRestriction restriction;
  const RestrictionCard({super.key, required this.restriction});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (restriction.extra=='')
              ? Text(restriction.description,style: Theme.of(context).textTheme.titleSmall)
                : ExpansionTile(
                  title: Text(restriction.description,style: Theme.of(context).textTheme.titleSmall),
                  subtitle: Text(restriction.frequency,style: Theme.of(context).textTheme.labelMedium),
                  tilePadding: EdgeInsets.zero,
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  children: [
                    Text(restriction.extra)
                  ],
                ),
            if(restriction.frequency!=''&&restriction.extra=='')
              Text(restriction.frequency,style: Theme.of(context).textTheme.labelMedium,),
            Row(
              children: [
                const Spacer(),
                Chip(label: Text('${restriction.currency} ${restriction.amount.floor().toString()}'))
              ],
            )

          ],
        ),
      ),
    );
  }
}
