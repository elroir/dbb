import 'package:pocketbase/pocketbase.dart';

import '../../../../core/error/exceptions.dart';
import '../models/dollar_model.dart';

abstract interface class DollarRemoteDatasource{
  Future<List<DollarModel>> getLatestDollar({String languageCode = 'es'});
}

class DollarRemoteDatasourceImpl implements DollarRemoteDatasource{

  final PocketBase _pb;

  DollarRemoteDatasourceImpl({required PocketBase pb}) : _pb = pb;


  @override
  Future<List<DollarModel>> getLatestDollar({String languageCode = 'es'}) async {
    try{
      final response = await _pb.collection('dollar_latest').getList(
          fields: 'id,buy_price,sell_price,name_$languageCode,description_$languageCode,created,user_editable'
      );
      return response.items.map((e) => DollarModel.fromRecordModel(e,languageCode)).toList();
    }on ClientException{
      throw NoInternetException();
    }
  }

}