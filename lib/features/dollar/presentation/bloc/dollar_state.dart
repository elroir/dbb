part of 'dollar_bloc.dart';

sealed class DollarState extends Equatable {
  final Dollar? pickedDollar;
  const DollarState({this.pickedDollar});
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

  const DollarLoaded({required this.dollars,super.pickedDollar});
  @override
  List<Object?> get props => [dollars,pickedDollar];
}

final class DollarError extends DollarState {
  final String message;

  const DollarError({required this.message});

  @override
  List<Object> get props => [message];
}