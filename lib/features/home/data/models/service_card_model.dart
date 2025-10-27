enum CardType { balance, internet, homeInternet }

class ServiceCardModel {
  final CardType type;
  final String title;
  final double amount;
  final double maxAmount;
  final String unit;
  final int daysRemaining;
  final DateTime lastUpdated;

  const ServiceCardModel({
    required this.type,
    required this.title,
    required this.amount,
    required this.maxAmount,
    required this.unit,
    required this.daysRemaining,
    required this.lastUpdated,
  });

  factory ServiceCardModel.fromJson(Map<String, dynamic> json) {
    return ServiceCardModel(
      type: CardType.values.byName(json['type'] as String),
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      maxAmount: (json['max_amount'] as num).toDouble(),
      unit: json['unit'] as String,
      daysRemaining: json['days_remaining'] as int,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type.toString().split('.').last,
      'title': title,
      'amount': amount,
      'max_amount': maxAmount,
      'unit': unit,
      'days_remaining': daysRemaining,
      'last_updated': lastUpdated.toIso8601String(),
    };
  }
}
