import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';

import 'core/http/http_options.dart';
import 'core/http/pocketbase_options.dart';
import 'features/bank/data/data_sources/bank_local_datasource.dart';
import 'features/bank/data/data_sources/bank_remote_datasource.dart';
import 'features/bank/data/repositories/bank_repository_impl.dart';
import 'features/bank/domain/repositories/bank_repository.dart';
import 'features/bank/domain/use_cases/fetch_banks_use_case.dart';
import 'features/bank/domain/use_cases/get_banks_use_case.dart';
import 'features/home/data/repositories/url_launcher.dart';
import 'features/home/domain/repositories/url_repository.dart';


final locator = GetIt.instance;

void setup() {
  // External
    locator.registerSingleton<Dio>(HttpOptions.client);
    locator.registerSingleton<PocketBase>(PocketBaseOptions.pb);
    locator.registerSingleton<UrlRepository>(UrlLauncher());


  // Bank Feature
    locator.registerLazySingleton<BankRemoteDatasource>(() => BankRemoteDatasourceImpl(pb: locator()));
    locator.registerLazySingleton<BankLocalDatasource>(() => BankLocalDatasourceImpl());
    locator.registerLazySingleton<BankRepository>(() => BankRepositoryImpl(remoteDatasource: locator(), localDatasource: locator()));
    locator.registerLazySingleton<FetchBanks>(() => FetchBanks(repository: locator()));
    locator.registerLazySingleton<GetBanks>(() => GetBanks(repository: locator()));


}