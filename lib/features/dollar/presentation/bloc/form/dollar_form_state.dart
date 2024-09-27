part of 'dollar_form_bloc.dart';

class DollarFormState extends Equatable {
  final String buyPrice;
  final String sellPrice;
  final Dollar? dollar;
  final bool canSend;
  final bool loading;
  const DollarFormState({
    this.buyPrice = '',
    this.sellPrice = '',
    this.dollar,
    this.canSend = false,
    this.loading = false,
  });

  DollarFormState copyWith({
    String? buyPrice,
    String? sellPrice,
    Dollar? dollar,
    bool? canSend,
    bool? loading,
  }) =>
      DollarFormState(
        buyPrice: buyPrice ?? this.buyPrice,
        sellPrice: sellPrice ?? this.sellPrice,
        dollar: dollar ?? this.dollar,
        canSend: canSend ?? this.canSend,
        loading: loading ?? this.loading
      );

  @override
  List<Object?> get props => [buyPrice, sellPrice, dollar, canSend,loading];
}

class DollarFormSuccess extends DollarFormState {
  @override
  List<Object?> get props => [];
}

class DollarFormError extends DollarFormState {
  final String message;

  const DollarFormError({required this.message});
  @override
  List<Object?> get props => [];
}