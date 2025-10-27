import '../../domain/entities/balance_entity.dart';

class BalanceModel extends BalanceEntity {
  const BalanceModel({
    required super.amount,
    required super.maxAmount,
    required super.unit,
    required super.daysRemaining,
    required super.lastUpdated,
  });

  factory BalanceModel.fromJson(Map<String, dynamic> json) {
    return BalanceModel(
      amount: (json['amount'] as num).toDouble(),
      maxAmount: (json['max_amount'] as num).toDouble(),
      unit: json['unit'] as String,
      daysRemaining: json['days_remaining'] as int,
      lastUpdated: DateTime.parse(json['last_updated'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'max_amount': maxAmount,
      'unit': unit,
      'days_remaining': daysRemaining,
      'last_updated': lastUpdated.toIso8601String(),
    };
  }
}
