import 'package:epicBid/cubits/auction_cubit/auction_cubit.dart';
import 'package:epicBid/cubits/auction_cubit/auction_states.dart';
import 'package:epicBid/pages/bidders_page.dart';
import 'package:epicBid/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceBidPage extends StatefulWidget {
  const PlaceBidPage({super.key});

  static String id = 'bid request';

  @override
  State<PlaceBidPage> createState() => _PlaceBidPageState();
}

class _PlaceBidPageState extends State<PlaceBidPage> {
  final _formKey = GlobalKey<FormState>();
  final _bidAmountController = TextEditingController();
  bool _isLoading = false;
  late int productId; // Will be initialized in didChangeDependencies

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Extract productId from route arguments
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    productId = args?['productId'] as int? ?? 0; // Default to 0 or handle error
  }

  @override
  void dispose() {
    _bidAmountController.dispose();
    super.dispose();
  }

  Future<void> _submitBid() async {
    if (_formKey.currentState!.validate()) {
      final bidAmount = double.tryParse(_bidAmountController.text) ?? 0;
      if (bidAmount > 0) {
        setState(() => _isLoading = true);

        try {
          await context.read<AuctionCubit>().placeBid(productId, bidAmount);

          if (!mounted) return;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BiddersPage(),
            ),
          );
        } catch (e) {
          if (!mounted) return;
          SnackBarService.showErrorMessage(
              'Failed to place bid: ${e.toString()}');
        } finally {
          if (mounted) {
            setState(() => _isLoading = false);
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuctionCubit, AuctionStates>(
      listener: (context, state) {
        if (state is BidPlacedSuccessfully) {
          SnackBarService.showSuccessMessage('Bid placed successfully!');
        } else if (state is BidFailedState) {
          setState(() => _isLoading = false);
          //print(state.error);
          //SnackBarService.showErrorMessage(state.error);
          //print(state.error);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const ImageIcon(
              AssetImage("assets/icons/arrow.png"),
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              "Product Auction",
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
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  "place your bid",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff2D5356),
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextFormField(
                  controller: _bidAmountController,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Color(0xff4C4C4C),
                  ),
                  cursorColor: const Color(0xff4C4C4C),
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    labelText: 'Your Bid',
                    labelStyle: const TextStyle(
                      color: Color(0xff4C4C4C),
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xff4C4C4C),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xff4C4C4C),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a bid amount';
                    }
                    final amount = double.tryParse(value);
                    if (amount == null || amount <= 0) {
                      return 'Please enter a valid amount';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _submitBid,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff2D5356),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          minimumSize: const Size(124, 42),
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
