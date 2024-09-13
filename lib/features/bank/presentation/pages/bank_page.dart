import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/pages/no_internet_error_view.dart';

import '../bloc/bank_bloc.dart';
import '../widgets/bank_item.dart';

class BankPage extends StatelessWidget {
  const BankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BankBloc, BankState>(

        builder: (context, state) {
          if(state is BankLoaded){
            return ListView.builder(
              itemCount: state.banks.length,
              itemBuilder: (_, i) => BankItem(bank: state.banks[i]),
            );
          }
          if(state is BankError){
            return const NoInternetErrorView();
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),

    );

  }
}


