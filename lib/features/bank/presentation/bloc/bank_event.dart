part of 'bank_bloc.dart';

sealed class BankEvent extends Equatable {
  const BankEvent();
}

class InitBanks extends BankEvent {
  @override
  List<Object> get props => [];
}
