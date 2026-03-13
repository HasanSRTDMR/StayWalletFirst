class LoyaltyStatusModel {
  final String tier; // Gold, Diamond, Platinum
  final int currentPoints;
  final int nextTierPoints;
  final String nextTier;
  final String message;

  LoyaltyStatusModel({
    required this.tier,
    required this.currentPoints,
    required this.nextTierPoints,
    required this.nextTier,
    required this.message,
  });

  double get progress => currentPoints / nextTierPoints;

  Map<String, dynamic> toJson() => {
        'tier': tier,
        'currentPoints': currentPoints,
        'nextTierPoints': nextTierPoints,
        'nextTier': nextTier,
        'message': message,
      };

  factory LoyaltyStatusModel.fromJson(Map<String, dynamic> json) =>
      LoyaltyStatusModel(
        tier: json['tier'] as String,
        currentPoints: json['currentPoints'] as int,
        nextTierPoints: json['nextTierPoints'] as int,
        nextTier: json['nextTier'] as String,
        message: json['message'] as String,
      );
}
