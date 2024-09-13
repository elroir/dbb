import 'package:pocketbase/pocketbase.dart';

import '../../domain/entities/bank.dart';
import '../../domain/entities/bank_restriction.dart';
import '../../domain/entities/data_source.dart';
import 'bank_restriction_model.dart';
import 'data_source_model.dart';

class BankModel extends Bank{
  BankModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.code,
    super.dataSources,
    super.restrictions,
  });

  factory BankModel.fromJson(Map<String, dynamic> json){
    return BankModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      code: json['code'],
      dataSources: json['data_source'].map<DataSource>((e) => DataSourceModel.fromJson(e)).toList(),
      restrictions: json['restrictions'].map<BankRestriction>((e) => BankRestrictionModel.fromJson(e['id'],e)).toList(),
    );
  }

  factory BankModel.fromRecordModel(RecordModel record){
    return BankModel(
      id: record.id,
      name: record.data['name'],
      icon: record.data['icon'],
      code: record.data['code'],
      dataSources: record.expand['data_source']!.map<DataSource>((e) => DataSourceModel.fromJson(e.data)).toList(),
      restrictions: [],
    );
  }

}