import 'package:equatable/equatable.dart';

class BalanceEntity extends Equatable {
  final double amount;
  final double maxAmount;
  final String unit;
  final int daysRemaining;
  final DateTime lastUpdated;

  const BalanceEntity({
    required this.amount,
    required this.maxAmount,
    required this.unit,
    required this.daysRemaining,
    required this.lastUpdated,
  });

  double get percentage => (amount / maxAmount) * 100;

  @override
  List<Object?> get props => [
    amount,
    maxAmount,
    unit,
    daysRemaining,
    lastUpdated,
  ];
}
