class BankRestriction {
  final String id;
  final String? name;
  final String description;
  final String currency;
  final String frequency;
  final String bankId;
  final double amount;
  final DateTime lastUpdate;

  BankRestriction({
    required this.id,
    this.name,
    required this.description,
    required this.currency,
    required this.frequency,
    required this.amount,
    required this.bankId,
    required this.lastUpdate
  });
}
