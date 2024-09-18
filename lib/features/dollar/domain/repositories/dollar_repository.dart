import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/dollar.dart';

abstract interface class DollarRepository{
  Future<Either<Failure,List<Dollar>>> getLatestDollar({String languageCode = 'es'});
}