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
            return CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (_,i) =>  BankItem(bank: state.banks[i]),
                    childCount: state.banks.length
                  ),
                ),
                const SliverPadding(
                  padding: EdgeInsets.only(bottom: 100),
                )
              ],
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


