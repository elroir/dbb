import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PriceItem extends StatelessWidget {
  final double price;
  final bool isPurchase;
  const PriceItem({super.key,required this.price, this.isPurchase = true});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(isPurchase ? localization.purchase : localization.sale,style: Theme.of(context).textTheme.titleMedium),
        Text(price.toStringAsFixed(2),style: Theme.of(context).textTheme.bodyLarge)
      ],
    );
  }
}
