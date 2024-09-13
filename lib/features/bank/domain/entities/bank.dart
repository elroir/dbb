import 'bank_restriction.dart';
import 'data_source.dart';

class Bank {
  final String id;
  final String name;
  final String icon;
  final String code;
  final DateTime? lastUpdate;
  final List<DataSource> dataSources;
  final List<BankRestriction> restrictions;

  const Bank({
    required this.id,
    required this.name,
    required this.icon,
    required this.code,
    this.lastUpdate,
    this.dataSources = const [],
    this.restrictions = const [],
  });

  Bank copyWith({
    String? id,
    String? name,
    String? icon,
    String? code,
    DateTime? lastUpdate,
    List<DataSource>? dataSources,
    List<BankRestriction>? restrictions,
  }) {
    return Bank(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      code: code ?? this.code,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      dataSources: dataSources ?? this.dataSources,
      restrictions: restrictions ?? this.restrictions,
    );
  }



}