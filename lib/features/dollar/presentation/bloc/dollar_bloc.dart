import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/dollar.dart';
import '../../domain/use_cases/get_latest_dollars_use_case.dart';

part 'dollar_event.dart';
part 'dollar_state.dart';

class DollarBloc extends Bloc<DollarEvent, DollarState> {
  final GetLatestDollar _getLatestDollar;
  DollarBloc(this._getLatestDollar) : super(DollarInitial()) {
    on<GetDollars>((event, emit) async {
      emit(DollarLoading());
      final dollarsOrFailure = await _getLatestDollar(languageCode: event.languageCode);
      dollarsOrFailure.fold(
              (error) => emit(DollarError(message: error.errorMessage)),
              (dollars) {
            emit(DollarLoaded(dollars: dollars));
          }
      );
    });

    on<PickDollar>((event, emit) async {
      final currentState = state;
      if(currentState is DollarLoaded){
        emit(DollarLoaded(pickedDollar: event.dollar,dollars: currentState.dollars));
      }
    });
  }
}
