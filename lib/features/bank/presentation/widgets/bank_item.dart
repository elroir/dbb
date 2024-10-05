import 'package:flutter/material.dart';

import '../../../../core/resources/app_resources.dart';
import '../../../home/presentation/widgets/updated_text.dart';
import '../../../home/presentation/widgets/url_chip.dart';
import '../../domain/entities/bank.dart';

class BankItem extends StatelessWidget {
  final Bank bank;
  const BankItem({
    super.key,
    required this.bank
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding,vertical: AppPadding.bankListItemPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(bank.name,style: Theme.of(context).textTheme.titleLarge),
          Wrap(
            spacing: 10,
            children: bank.dataSources.map((e) => UrlChip(text: e.name,url: e.url)).toList(),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bank.restrictions.length,
            itemBuilder: (_, i) => Card(
              child: ListTile(
                title: Text(bank.restrictions[i].description,maxLines: 2,style: Theme.of(context).textTheme.titleSmall),
                subtitle: Text(bank.restrictions[i].frequency),
                trailing: Text('${bank.restrictions[i].currency} ${bank.restrictions[i].amount.floor().toString()}'),
              ),
            )
          ),
          if(bank.restrictions.isNotEmpty)
            UpdatedText(dateTime: bank.restrictions.first.lastUpdate)
        ],
      ),
    );
  }
}