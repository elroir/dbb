import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dollar_form_event.dart';
part 'dollar_form_state.dart';

class DollarFormBloc extends Bloc<DollarFormEvent, DollarFormState> {
  DollarFormBloc() : super(DollarFormInitial()) {
    on<DollarFormEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
