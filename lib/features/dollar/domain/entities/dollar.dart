class Dollar {
  final String id;
  final double buyPrice;
  final double sellPrice;
  final double averageBuyPrice;
  final double averageSellPrice;
  final String name;
  final String description;
  final bool canEdit;
  final DateTime lastUpdate;

  Dollar({
    required this.id,
    this.buyPrice = 0,
    this.sellPrice = 0,
    this.averageBuyPrice = 0,
    this.averageSellPrice = 0,
    this.name = '',
    this.description = '',
    this.canEdit = false,
    required this.lastUpdate,
  });

  Dollar copyWith({
    double? buyPrice,
    double? sellPrice,
    double? averageBuyPrice,
    double? averageSellPrice,
    String? name,
    String? description,
    bool? canEdit,
  }) => Dollar(
    id: id,
    buyPrice: buyPrice ?? this.buyPrice,
    sellPrice: sellPrice ?? this.sellPrice,
    averageBuyPrice: averageBuyPrice ?? this.averageBuyPrice,
    averageSellPrice: averageSellPrice ?? this.averageSellPrice,
    name: name ?? this.name,
    description: description ?? this.description,
    canEdit: canEdit ?? this.canEdit,
    lastUpdate: lastUpdate,
  );
}
