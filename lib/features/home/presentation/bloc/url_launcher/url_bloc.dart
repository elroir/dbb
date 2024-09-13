
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/error/error_messages.dart';
import '../../../domain/repositories/url_repository.dart';

part 'url_event.dart';
part 'url_state.dart';

class UrlBloc extends Bloc<UrlEvent, UrlState> {

  final UrlRepository _urlRepository;

  UrlBloc(this._urlRepository) : super(UrlInitial()) {

    on<LaunchUrl>((event, emit) async {
      final canOpen = await _urlRepository.canParseUrl(event.link);
      if(!canOpen){
        emit(const UrlError(message: ErrorMessages.cantLaunchUrlMessage));
        return ;
      }
      await _urlRepository.openUrl(event.link);

      emit(UrlSuccess());

    });
  }
}
