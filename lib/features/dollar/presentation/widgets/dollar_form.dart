import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/resources/app_resources.dart';
import '../../../../core/router/router.dart';
import '../bloc/dollar_bloc.dart';
import '../bloc/form/dollar_form_bloc.dart';

class DollarForm extends StatelessWidget {
  const DollarForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DollarBloc, DollarState>(
      builder: (_, state) {
        if(state is DollarLoaded){
          return BlocProvider(
            create: (context) => DollarFormBloc(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding,vertical: AppPadding.dialogVerticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                    if(state.pickedDollar!=null)
                      Text('${AppLocalizations.of(context)!.dollar} ${state.pickedDollar!.name}',style: Theme.of(context).textTheme.titleLarge,),
                      const Spacer(),
                      InkWell(
                        onTap: () => context.pop(),
                        child: const Icon(IconsaxPlusBold.close_square),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(AppLocalizations.of(context)!.purchase,style: Theme.of(context).textTheme.titleMedium,),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Ingrese el precio de compra'
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(AppLocalizations.of(context)!.sale,style: Theme.of(context).textTheme.titleMedium,),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: 'Ingrese el precio de venta'
                    ),
                  ),
                  const Spacer(),
                  SafeArea(
                    bottom: true,
                    child: FractionallySizedBox(
                      widthFactor: 1,
                      child: ElevatedButton(
                        onPressed: (){},
                        child: const Text('Enviar'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
