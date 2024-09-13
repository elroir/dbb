import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/bank.dart';
import '../../domain/use_cases/fetch_banks_use_case.dart';
import '../../domain/use_cases/get_banks_use_case.dart';

part 'bank_event.dart';
part 'bank_state.dart';

class BankBloc extends Bloc<BankEvent, BankState> {
  final FetchBanks _fetchBanks;
  final GetBanks _getBanks;

  BankBloc(this._fetchBanks,this._getBanks) : super(BankInitial()) {
    on<InitBanks>((event, emit) async {
      emit(BankLoading());
      final banksOrFailure = await _fetchBanks();
      banksOrFailure.fold(
        (error) => emit(BankError(message: error.errorMessage)),
        (success) {
          final banks = _getBanks();
          emit(BankLoaded(banks: banks));
        }
      );
    });
  }
}
