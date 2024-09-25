import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http/http_response.dart';
import '../entities/dollar.dart';
import '../repositories/dollar_repository.dart';

class SaveDollar{
  final DollarRepository _dollarRepository;

  SaveDollar({required DollarRepository dollarRepository}) : _dollarRepository = dollarRepository;

  Future<Either<Failure,HttpSuccess>> call({required Dollar dollar}) => _dollarRepository.saveDollar(dollar: dollar);
}