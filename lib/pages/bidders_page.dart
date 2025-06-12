import 'package:epicBid/cubits/auction_cubit/auction_cubit.dart';
import 'package:epicBid/cubits/auction_cubit/auction_states.dart';
import 'package:epicBid/widgets/bidder_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BiddersPage extends StatelessWidget {
  final int productId = 233;

  const BiddersPage({
    super.key,
  });

  static String id = 'bidder';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuctionCubit()..getAuctionForProduct(productId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const ImageIcon(AssetImage("assets/icons/arrow.png")),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              "All Bidders",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<AuctionCubit, AuctionStates>(
          builder: (context, state) {
            if (state is AuctionBidsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuctionBidsError) {
              return Center(child: Text(state.error));
            } else if (state is AuctionBidsLoaded) {
              return ListView.builder(
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.bids.length,
                itemBuilder: (context, index) {
                  final bid = state.bids[index];
                  return BidderCardWidget(
                    userName: bid.userName,
                    bidAmount: bid.bidAmount,
                    createdAt: bid.createdAt,
                  );
                },
              );
            }
            return const SizedBox(); // Initial state
          },
        ),
      ),
    );
  }
}
