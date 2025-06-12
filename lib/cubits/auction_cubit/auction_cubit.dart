import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:epicBid/cubits/auction_cubit/auction_states.dart';
import 'package:http/http.dart' as http;

import '../../models/auction_bid_model.dart';

class AuctionCubit extends Cubit<AuctionStates> {
  AuctionCubit() : super(InitialAuctionState());

  //bid request
  Future<void> placeBid(int productId, double bidAmount) async {
    try {
      final response = await http.post(
        Uri.parse('https://ebic-bid1.runasp.net/api/Auction/Bid'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'ProductId': productId,
          'BidAmount': bidAmount,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(BidPlacedSuccessfully(
          bidAmount: bidAmount,
          productId: productId,
          responseData: data,
        ));
      } else {
        throw Exception(data['message'] ?? 'Failed to place bid');
      }
    } catch (e) {
      emit(BidFailedState(
        error: 'Bid error: ${e.toString()}',
        productId: productId,
      ));
    }
  }

  //Get auction for product
  Future<void> getAuctionForProduct(int productId) async {
    try {
      emit(AuctionBidsLoading());

      final response = await http.get(
        Uri.parse(
            'http://ebic-bid11.runasp.net/api/Auction/GetAuctionForProduct?productid=$productId'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final bids = data.map((json) => AuctionBid.fromJson(json)).toList();

        emit(AuctionBidsLoaded(
          bids: bids,
          productId: productId,
        ));
      } else {
        throw Exception('Failed to load bids: ${response.statusCode}');
      }
    } catch (e) {
      emit(AuctionBidsError(
        error: 'Failed to get auction bids: ${e.toString()}',
        productId: productId,
      ));
    }
  }
}
