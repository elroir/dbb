part of 'dollar_bloc.dart';

sealed class DollarState extends Equatable {
  const DollarState();
}

final class DollarInitial extends DollarState {
  @override
  List<Object> get props => [];
}

final class DollarLoading extends DollarState {
  @override
  List<Object> get props => [];
}
final class DollarLoaded extends DollarState {
  final List<Dollar> dollars;

  const DollarLoaded({required this.dollars});
  @override
  List<Object> get props => [dollars];
}

final class DollarError extends DollarState {
  final String message;

  const DollarError({required this.message});

  @override
  List<Object> get props => [message];
}