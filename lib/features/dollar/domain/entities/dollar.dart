class Dollar {
  final String id;
  final double buyPrice;
  final double sellPrice;
  final String name;
  final String description;
  final bool canEdit;
  final DateTime lastUpdate;

  Dollar({
    required this.id,
    required this.buyPrice,
    required this.sellPrice,
    required this.name,
    required this.description,
    this.canEdit = false,
    required this.lastUpdate,
  });
}
