import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/http/http_response.dart';
import '../repositories/bank_repository.dart';

class FetchBanks {
  final BankRepository _repository;

  FetchBanks({required BankRepository repository}) : _repository = repository;

  Future<Either<Failure,HttpSuccess>> call() async {
    final banksOrFailure = await _repository.fetchBanks();
    return banksOrFailure.fold(
            (error) => Left(error),
            (banks) async {
              final restrictionsOrFailure = await _repository.getDebitCardsRestrictions();
              return restrictionsOrFailure.fold(
                      (error) => Left(error),
                      (restrictions) {
                        return Right(restrictions);
                      }
              );
            }
    );
  }

}