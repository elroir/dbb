import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/dollar.dart';

import '../../domain/repositories/dollar_repository.dart';
import '../data_sources/dollar_remote_datasource.dart';

class DollarRepositoryImpl implements DollarRepository{
  final DollarRemoteDatasource _dollarRemoteDataSource;

  DollarRepositoryImpl({required DollarRemoteDatasource remoteDatasource}) : _dollarRemoteDataSource = remoteDatasource;
  @override
  Future<Either<Failure, List<Dollar>>> getLatestDollar({String languageCode = 'es'}) async {
    try{
      final dollars = await _dollarRemoteDataSource.getLatestDollar(languageCode: languageCode);
      return Right(dollars);

    }on ServerException{
      return Left(ServerFailure());
    } on NoInternetException{
      return Left(SocketFailure());
    }
  }

}