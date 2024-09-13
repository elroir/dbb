import '../../domain/entities/data_source.dart';

class DataSourceModel extends DataSource{
  DataSourceModel({
    required super.name,
    required super.url,
  });

  factory DataSourceModel.fromJson(Map<String, dynamic> json) => DataSourceModel(
      name: json['name'],
      url: json['url'],
    );


}