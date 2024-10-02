import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/resources/app_resources.dart';
import '../../../../core/router/router.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/widgets/loading_button.dart';
import '../bloc/dollar_bloc.dart';
import '../bloc/form/dollar_form_bloc.dart';

class DollarForm extends StatelessWidget {
  const DollarForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
      child: BlocBuilder<DollarBloc, DollarState>(
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
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(AppLocalizations.of(context)!.supportMessage))
                          );
                          context.read<DollarBloc>().add(GetDollars(languageCode: Localizations.localeOf(context).languageCode));
                        }
                        if(state is DollarFormError){
                          context.pop();

                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message),backgroundColor: Colors.redAccent,)
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding,vertical: AppPadding.dialogVerticalPadding),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                children: [
                                  if(dollarState.pickedDollar!=null)
                                    Text(AppLocalizations.of(context)!.dollarType(dollarState.pickedDollar!.name),style: Theme.of(context).textTheme.titleLarge,),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () => context.pop(),
                                    child: const Icon(IconsaxPlusBold.close_square),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Text(AppLocalizations.of(context)!.dollarFormMessage,style: Theme.of(context).textTheme.labelMedium,),
                              const SizedBox(height: 10,),
                              Text(AppLocalizations.of(context)!.purchase,style: Theme.of(context).textTheme.titleMedium,),
                              TextField(
                                keyboardType: const TextInputType.numberWithOptions(signed: false,decimal: true),
                                decoration: InputDecoration(
                                    hintText: AppLocalizations.of(context)!.purchaseHint
                                ),
                                onChanged: (value) => context.read<DollarFormBloc>().add(ChangePurchaseDollar(text: value)),
                              ),
                              const SizedBox(height: 10,),
                              Text(AppLocalizations.of(context)!.sale,style: Theme.of(context).textTheme.titleMedium,),
                              TextField(
                                keyboardType: const TextInputType.numberWithOptions(signed: false,decimal: true),
                                decoration:  InputDecoration(
                                    hintText: AppLocalizations.of(context)!.saleHint
                                ),
                                onChanged: (value) => context.read<DollarFormBloc>().add(ChangeSaleDollar(text: value)),
                              ),
                              const SizedBox(height: 40),
                              BlocBuilder<DollarFormBloc, DollarFormState>(
                                builder: (context, state) {
                                  return SafeArea(
                                    bottom: true,
                                    child: LoadingButton(
                                      widthFactor: 1,
                                        onPressed: state.canSend
                                            ? () => context.read<DollarFormBloc>().add(SendDollar(dollar: dollarState.pickedDollar))
                                            : null,
                                        buttonText: AppLocalizations.of(context)!.send,
                                      isLoading: state.loading,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
