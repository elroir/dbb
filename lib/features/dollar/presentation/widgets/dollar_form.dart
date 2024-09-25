import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/resources/app_resources.dart';
import '../../../../core/router/router.dart';
import '../../../../injection_container.dart';
import '../bloc/dollar_bloc.dart';
import '../bloc/form/dollar_form_bloc.dart';

class DollarForm extends StatelessWidget {
  const DollarForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DollarBloc, DollarState>(
      builder: (_, dollarState) {
        if(dollarState is DollarLoaded){
          return BlocProvider(
            create: (context) => DollarFormBloc(locator()),
            child: Builder(
                builder: (context) {
                  return BlocListener<DollarFormBloc, DollarFormState>(
                    listener: (context, state) {
                      if(state is DollarFormSuccess){
                        context.pop();
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Datos enviados correctamente')));
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding,vertical: AppPadding.dialogVerticalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if(dollarState.pickedDollar!=null)
                                Text('${AppLocalizations.of(context)!.dollar} ${dollarState.pickedDollar!.name}',style: Theme.of(context).textTheme.titleLarge,),
                              const Spacer(),
                              InkWell(
                                onTap: () => context.pop(),
                                child: const Icon(IconsaxPlusBold.close_square),
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Text(AppLocalizations.of(context)!.purchase,style: Theme.of(context).textTheme.titleMedium,),
                          TextField(
                            keyboardType: const TextInputType.numberWithOptions(signed: false,decimal: true),
                            decoration: const InputDecoration(
                                hintText: 'Ingrese el precio de compra'
                            ),
                            onChanged: (value) => context.read<DollarFormBloc>().add(ChangePurchaseDollar(text: value)),
                          ),
                          const SizedBox(height: 10,),
                          Text(AppLocalizations.of(context)!.sale,style: Theme.of(context).textTheme.titleMedium,),
                          TextField(
                            keyboardType: const TextInputType.numberWithOptions(signed: false,decimal: true),
                            decoration: const InputDecoration(
                                hintText: 'Ingrese el precio de venta'
                            ),
                            onChanged: (value) => context.read<DollarFormBloc>().add(ChangeSaleDollar(text: value)),
                          ),

                          const Spacer(),
                          BlocBuilder<DollarFormBloc, DollarFormState>(
                            builder: (context, state) {
                              return SafeArea(
                                bottom: true,
                                child: FractionallySizedBox(
                                  widthFactor: 1,
                                  child: ElevatedButton(
                                    onPressed: state.canSend
                                        ? () => context.read<DollarFormBloc>().add(SendDollar(dollar: dollarState.pickedDollar))
                                        : null,
                                    child: const Text('Enviar'),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
