import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extension/string_extensions.dart';
import '../../../domain/entities/dollar.dart';
import '../../../domain/use_cases/save_dollar_use_case.dart';

part 'dollar_form_event.dart';
part 'dollar_form_state.dart';

class DollarFormBloc extends Bloc<DollarFormEvent, DollarFormState> {
  final SaveDollar _saveDollar;
  DollarFormBloc(this._saveDollar) : super(const DollarFormState()) {

    on<ChangeSaleDollar>((event, emit) {
      emit(state.copyWith(sellPrice: event.text,canSend: event.text.isNumeric() || state.buyPrice.isNumeric()));
    });

    on<ChangePurchaseDollar>((event, emit) {
      emit(state.copyWith(buyPrice: event.text,canSend: event.text.isNumeric() || state.sellPrice.isNumeric()));
    });

    on<SendDollar>((event, emit) async {

      if(event.dollar==null) return;

      double buyPrice = 0;
      double sellPrice = 0;
      if(state.buyPrice.isNumeric()){
        buyPrice = double.parse(state.buyPrice);
      }
      if(state.sellPrice.isNumeric()){
        sellPrice = double.parse(state.sellPrice);
      }


      final dollar = event.dollar!.copyWith(
        buyPrice: buyPrice,
        sellPrice: sellPrice
      );

      emit(state.copyWith(loading: true));

      final saveOrFail = await _saveDollar(dollar: dollar);

      emit(saveOrFail.fold(
          (error) => DollarFormError(message: error.errorMessage),
          (ok)    => DollarFormSuccess()
      ));


    });

  }
}
