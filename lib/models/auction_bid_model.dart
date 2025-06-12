class AuctionBid {
  final String userId;
  final String userName;
  final double bidAmount;
  final DateTime createdAt;

  AuctionBid({
    required this.userId,
    required this.userName,
    required this.bidAmount,
    required this.createdAt,
  });

  factory AuctionBid.fromJson(Map<String, dynamic> json) {
    return AuctionBid(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      bidAmount: (json['bidAmount'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
