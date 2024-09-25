part of 'dollar_form_bloc.dart';

sealed class DollarFormEvent extends Equatable {
  const DollarFormEvent();
}


final class ChangePurchaseDollar extends DollarFormEvent{
  final String? text;

  const ChangePurchaseDollar({this.text});
  @override
  List<Object?> get props => [text];

}

final class ChangeSaleDollar extends DollarFormEvent{
  final String? text;

  const ChangeSaleDollar({this.text});
  @override
  List<Object?> get props => [text];

}

final class SendDollar extends DollarFormEvent{

  final Dollar? dollar;

  const SendDollar({required this.dollar});

  @override
  List<Object?> get props => [];

}