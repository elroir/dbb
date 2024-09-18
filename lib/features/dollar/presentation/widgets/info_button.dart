import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/resources/app_resources.dart';
import '../../../../core/router/router.dart';

class InfoButton extends StatelessWidget {
  final String description;
  const InfoButton({super.key,required this.description});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: () => showDialog(
          context: context,
          builder: (_) => Dialog(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding,vertical: AppPadding.dialogVerticalPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.description,style: Theme.of(context).textTheme.titleLarge,),
                      IconButton(
                        visualDensity: VisualDensity.compact,
                        onPressed: () => context.pop(),
                        icon: const Icon(IconsaxPlusBold.close_circle),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(description,textAlign: TextAlign.justify,)
                ],
              ),
            ),
          )
      ),
      child: const Icon(IconsaxPlusBold.info_circle,color: AppColors.secondaryColor,),
    );
  }
}
