import 'package:pocketbase/pocketbase.dart';

import '../../domain/entities/dollar.dart';

class DollarModel extends Dollar{

  DollarModel({
    required super.id,
    required super.buyPrice,
    required super.sellPrice,
    super.name,
    super.description,
    super.canEdit,
    required super.lastUpdate
  });

  factory DollarModel.fromEntity(Dollar dollar){
    return DollarModel(
        id: dollar.id,
        name: dollar.name,
        description: dollar.description,
        buyPrice: dollar.buyPrice,
        sellPrice: dollar.sellPrice,
        canEdit: dollar.canEdit,
        lastUpdate: dollar.lastUpdate
    );
  }

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

  /// [dollar_type] is the same as dollar id as dollar_latest return last value of each type of dollar
  Map<String,dynamic> toJson() => {
    'buy_price' : buyPrice,
    'sell_price' : sellPrice,
    'dollar_type' : id,
    'user_source' : 'user'
  };

}