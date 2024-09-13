import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/resources/app_resources.dart';
import '../../../bank/presentation/bloc/bank_bloc.dart';

class NoInternetErrorView extends StatelessWidget {
  final String message;
  const NoInternetErrorView({super.key, this.message = ''});

  @override
  Widget build(BuildContext context) {
    final bankState = context.read<BankBloc>().state;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(AppAssets.badConnection,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.horizontalPadding),
          child: Text((bankState is BankError)
              ? bankState.message
              : message,
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppPadding.topPadding),
        FractionallySizedBox(
          widthFactor: 0.9,
          child: ElevatedButton(
              onPressed: () => context.read<BankBloc>().add(InitBanks()),
              child: Text(AppLocalizations.of(context)!.retry)
          ),
        )

      ],
    );
  }
}
