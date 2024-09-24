part of 'dollar_bloc.dart';

sealed class DollarEvent extends Equatable {
  const DollarEvent();
}

final class GetDollars extends DollarEvent{
  final String languageCode;

  const GetDollars({required this.languageCode});
  @override
  List<Object?> get props => [languageCode];

}

final class PickDollar extends DollarEvent{
  final Dollar? dollar;

  const PickDollar({this.dollar});
  @override
  List<Object?> get props => [dollar];

}