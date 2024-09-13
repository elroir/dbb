part of 'bank_bloc.dart';

sealed class BankState extends Equatable {
  const BankState();
}

final class BankInitial extends BankState {
  @override
  List<Object> get props => [];
}

final class BankLoading extends BankState {
  @override
  List<Object> get props => [];
}

final class BankLoaded extends BankState {
  final List<Bank> banks;

  const BankLoaded({this.banks = const []});

  @override
  List<Object> get props => [banks];
}

final class BankError extends BankState {
  final String message;

  const BankError({required this.message});

  @override
  List<Object> get props => [message];
}
