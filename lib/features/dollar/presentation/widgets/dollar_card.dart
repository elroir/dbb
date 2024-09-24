import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';


import '../../../../core/resources/app_resources.dart';
import '../../../home/presentation/widgets/updated_text.dart';
import '../../domain/entities/dollar.dart';
import '../bloc/dollar_bloc.dart';
import 'dollar_form.dart';
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
              children: [
                Text(dollar.name,style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(width: 10),
                if(dollar.description!='')
                InfoButton(description: dollar.description),
                const Spacer(),
                if(dollar.canEdit)
                InkWell(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      useRootNavigator: true,
                      builder: (_) => BlocProvider.value(
                        value: context.read<DollarBloc>()..add(PickDollar(dollar: dollar)),
                          child: const DollarForm()
                      )
                    ),
                    child: const Icon(IconsaxPlusBold.add)
                )
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
