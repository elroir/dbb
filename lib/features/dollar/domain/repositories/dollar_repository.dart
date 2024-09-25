import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http/http_response.dart';
import '../entities/dollar.dart';

abstract interface class DollarRepository{
  Future<Either<Failure,List<Dollar>>> getLatestDollar({String languageCode = 'es'});
  Future<Either<Failure,HttpSuccess>> saveDollar({required Dollar dollar});

}