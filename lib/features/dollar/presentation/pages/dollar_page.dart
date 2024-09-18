import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/dollar_bloc.dart';
import '../widgets/dollar_card.dart';

class DollarPage extends StatelessWidget {
  const DollarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    return BlocProvider(
      create: (context) => DollarBloc(locator())..add(GetDollars(languageCode: languageCode)),
      child: Scaffold(
        body: BlocBuilder<DollarBloc, DollarState>(
          builder: (_, state) {
            if (state is DollarLoaded) {
              return ListView.builder(
                itemCount: state.dollars.length,
                itemBuilder: (_, i) => DollarCard(dollar: state.dollars[i])
              );
            }

            return const Center(child: CircularProgressIndicator.adaptive());
          },
        ),
      ),
    );
  }
}
