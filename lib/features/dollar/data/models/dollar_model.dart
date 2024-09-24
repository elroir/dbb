import 'package:pocketbase/pocketbase.dart';

import '../../domain/entities/dollar.dart';

class DollarModel extends Dollar{

  DollarModel({
    required super.id,
    required super.buyPrice,
    required super.sellPrice,
    required super.name,
    required super.description,
    required super.canEdit,
    required super.lastUpdate
  });

  factory DollarModel.fromRecordModel(RecordModel record,String languageCode){
    return DollarModel(
      id: record.id,
      name: record.data['name_$languageCode'],
      description: record.data['description_$languageCode'],
      buyPrice: record.data['buy_price']/1,
      sellPrice: record.data['sell_price']/1,
      canEdit: record.data['user_editable'] ?? false,
      lastUpdate: DateTime.parse(record.created).toLocal()

    );
  }

}