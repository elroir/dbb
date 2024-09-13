import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/http/http_response.dart';
import '../../domain/entities/bank.dart';
import '../../domain/entities/bank_restriction.dart';

import '../../domain/repositories/bank_repository.dart';
import '../data_sources/bank_local_datasource.dart';
import '../data_sources/bank_remote_datasource.dart';

class BankRepositoryImpl implements BankRepository{

  final BankRemoteDatasource _remoteDatasource;
  final BankLocalDatasource _localDatasource;

  BankRepositoryImpl({
    required BankRemoteDatasource remoteDatasource,
    required BankLocalDatasource localDatasource
  }) : _remoteDatasource = remoteDatasource,
       _localDatasource  = localDatasource;

  @override
  Future<Either<Failure, HttpSuccess>> fetchBanks() async {
    try{
      final banks = await _remoteDatasource.getBanks();
      _localDatasource.cacheBanks(banks: banks);
      return Right(HttpSuccess());

    }on ServerException{
      return Left(ServerFailure());
    } on NoInternetException{
      return Left(SocketFailure());
    }
  }

  @override
  Future<Either<Failure, HttpSuccess>> getDebitCardsRestrictions() async {
    try{
      final restrictions = await _remoteDatasource.getDebitCardsRestrictions();
      _addRestrictionsToBanks(restrictions);
      return Right(HttpSuccess());

    }on ServerException{
      return Left(ServerFailure());
    } on NoInternetException{
      return Left(SocketFailure());
    }
  }

  void _addRestrictionsToBanks(List<BankRestriction> restrictions){
    final banks = _localDatasource.getBanks();
    final completeBanks = List<Bank>.from(banks.map((bank) {
      final bankRestrictions = restrictions.where((restriction) => restriction.bankId == bank.id).toList();
      return bank.copyWith(restrictions: bankRestrictions);
    }));
    _localDatasource.cacheBanks(banks: completeBanks);
  }

  @override
  List<Bank> getBanks() {
    return _localDatasource.getBanks();
  }

}