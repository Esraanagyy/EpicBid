import '../../models/auction_bid_model.dart';

abstract class AuctionStates {}

class InitialAuctionState extends AuctionStates {}

class BidPlacedSuccessfully extends AuctionStates {
  final double bidAmount;
  final int productId;
  final Map<String, dynamic> responseData;

  BidPlacedSuccessfully({
    required this.bidAmount,
    required this.productId,
    required this.responseData,
  });
}

class BidFailedState extends AuctionStates {
  final String error;
  final int productId;

  BidFailedState({
    required this.error,
    required this.productId,
  });
}

// Add these to your states file
class AuctionBidsLoading extends AuctionStates {}

class AuctionBidsLoaded extends AuctionStates {
  final List<AuctionBid> bids;
  final int productId;

  AuctionBidsLoaded({
    required this.bids,
    required this.productId,
  });
}

class AuctionBidsError extends AuctionStates {
  final String error;
  final int productId;

  AuctionBidsError({
    required this.error,
    required this.productId,
  });
}
