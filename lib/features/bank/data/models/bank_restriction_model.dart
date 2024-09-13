import 'package:pocketbase/pocketbase.dart';

import '../../domain/entities/bank_restriction.dart';

class BankRestrictionModel extends BankRestriction{
  BankRestrictionModel({
    required super.id,
    super.name,
    required super.description,
    required super.currency,
    required super.frequency,
    required super.amount,
    required super.bankId,
    required super.lastUpdate
  });

  factory BankRestrictionModel.fromJson(String id,Map<String, dynamic> json){
    return BankRestrictionModel(
      id: id,
      name: json['name'],
      description: json['description'],
      currency: json['currency'],
      frequency: json['frequency'],
      amount: json['amount']/1,
      bankId: json['bank_id'],
      lastUpdate: json['created']
    );
  }

  factory BankRestrictionModel.fromRecordModel(RecordModel record){
    return BankRestrictionModel(
        id: record.id,
        name: record.data['name'],
        description: record.data['description'],
        currency: record.data['currency'],
        frequency: record.data['frequency'],
        amount: record.data['amount']/1,
        bankId: record.data['bank_id'],
        lastUpdate: DateTime.parse(record.created).toLocal()
    );
  }


}