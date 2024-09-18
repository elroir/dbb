import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/dollar.dart';
import '../repositories/dollar_repository.dart';

class GetLatestDollar{
  final DollarRepository _dollarRepository;

  GetLatestDollar({required DollarRepository dollarRepository}) : _dollarRepository = dollarRepository;

  Future<Either<Failure,List<Dollar>>> call({String languageCode = 'es'}) => _dollarRepository.getLatestDollar(languageCode: languageCode);

}