part of 'dollar_form_bloc.dart';

sealed class DollarFormState extends Equatable {
  const DollarFormState();
}

final class DollarFormInitial extends DollarFormState {
  @override
  List<Object> get props => [];
}
