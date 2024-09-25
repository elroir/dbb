part of 'dollar_form_bloc.dart';

class DollarFormState extends Equatable {
  final String buyPrice;
  final String sellPrice;
  final Dollar? dollar;
  final bool canSend;
  const DollarFormState({this.buyPrice = '', this.sellPrice = '', this.dollar,this.canSend = false,});

  DollarFormState copyWith({
    String? buyPrice,
    String? sellPrice,
    Dollar? dollar,
    bool? canSend,
  }) => DollarFormState(
      buyPrice: buyPrice ?? this.buyPrice,
      sellPrice: sellPrice ?? this.sellPrice,
      dollar: dollar ?? this.dollar,
    canSend: canSend ?? this.canSend
  );

  @override
  List<Object?> get props => [buyPrice,sellPrice,dollar,canSend];
}


class DollarFormSuccess extends DollarFormState{
  @override
  List<Object?> get props => [];
}

