import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http/http_response.dart';
import '../entities/bank.dart';

abstract interface class BankRepository{
  Future<Either<Failure,HttpSuccess>> fetchBanks();
  Future<Either<Failure,HttpSuccess>> getDebitCardsRestrictions();
  List<Bank> getBanks();

}