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