import 'package:flutter/material.dart';


import '../../../../core/resources/app_resources.dart';
import '../../../home/presentation/widgets/updated_text.dart';
import '../../domain/entities/dollar.dart';
import 'info_button.dart';
import 'price_item.dart';

class DollarCard extends StatelessWidget {
  final Dollar dollar;
  const DollarCard({super.key, required this.dollar});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding,vertical: AppPadding.bankListItemPadding),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(dollar.name,style: Theme.of(context).textTheme.titleLarge,),
                if(dollar.description!='')
                InfoButton(description: dollar.description)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.dollarPricePadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if(dollar.buyPrice!=0)
                    PriceItem(price: dollar.buyPrice,),
                  PriceItem(price: dollar.sellPrice,isPurchase: false,)
                ],
              ),
            ),
            UpdatedText(dateTime: dollar.lastUpdate)
          ],
        ),
      ),
    );
  }
}
