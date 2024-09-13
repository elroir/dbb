import 'package:pocketbase/pocketbase.dart';

import '../../../../core/error/exceptions.dart';
import '../models/bank_model.dart';
import '../models/bank_restriction_model.dart';

abstract interface class BankRemoteDatasource{

  Future<List<BankModel>> getBanks();
  Future<List<BankRestrictionModel>> getDebitCardsRestrictions();

}

class BankRemoteDatasourceImpl implements BankRemoteDatasource{

  final PocketBase _pb;

  BankRemoteDatasourceImpl({required PocketBase pb}) : _pb = pb;


  @override
Future<List<BankModel>> getBanks() async {
    try{
      final response = await _pb.collection('bank').getList(
        expand: 'data_source',
        fields: 'id,name,created,icon,code,url,expand.data_source.name,expand.data_source.url'
      );
      return response.items.map((e) => BankModel.fromRecordModel(e)).toList();
    }on ClientException{
      throw NoInternetException();
    }

  }

  @override
  Future<List<BankRestrictionModel>> getDebitCardsRestrictions() async {
    try{
      final response = await _pb.collection('debit_card').getList();
      return response.items.map((e) => BankRestrictionModel.fromRecordModel(e)).toList();
    }on ClientException{
      throw NoInternetException();
    }

  }

}
