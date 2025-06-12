import 'package:epicBid/pages/auction_page.dart';
import 'package:epicBid/pages/create_done.dart';
import 'package:epicBid/widgets/credit_card_widget.dart';
import 'package:epicBid/widgets/drop_down_widget.dart';
import 'package:epicBid/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class CreateAuction extends StatefulWidget {
  const CreateAuction({super.key});
  static String id = 'create auction';

  @override
  State<CreateAuction> createState() => _CreateAuctionState();
}

class _CreateAuctionState extends State<CreateAuction> {
  bool visaCheck = false;
  bool payCheck = false;
  bool cashCheck = false;
  bool termCheck = false;
  @override
  Widget build(BuildContext context) {
    final List<String> _productType = ['', ''];
    final List<String> _auctionTime = ['', ''];
    final List<String> _productColor = ['', ''];
    final List<String> _auctionType = ['', ''];
    final List<String> _city = ['', ''];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: false,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AuctionPage.id);
          },
          child: Image.asset('assets/icons/arrow.png'),
        ),
        title: const Padding(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.topRight,
            child: Text(
              'Create Auction',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Intel',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormFieldWidget(text: 'Auction Name'),
            TextFormFieldWidget(text: 'Status'),
            DropDownWidget(items: _productType, listName: 'Product Type'),
            DropDownWidget(items: _auctionTime, listName: 'Auction Time'),
            DropDownWidget(items: _productColor, listName: 'Product Color'),
            TextFormFieldWidget(text: 'Product Size'),
            DropDownWidget(items: _auctionType, listName: 'Auction Type'),
            DropDownWidget(items: _city, listName: 'City'),
            TextFormFieldWidget(text: 'Address'),
            TextFormFieldWidget(text: 'Zip Code'),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 8),
              child: Text(
                'Receive Your Money',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Intel',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        visaCheck = !visaCheck;
                      });
                    },
                    child: visaCheck
                        ? Image.asset('assets/icons/check.png')
                        : Image.asset('assets/icons/not check.png'),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Credit Card ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Intel',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                                top: 20,
                                left: 16,
                                right: 16,
                              ),
                              child:
                                  const CreditCardWidget(), // Replace with your actual container
                            );
                          });
                    },
                    child: Image.asset('assets/icons/visa.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 5),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        payCheck = !payCheck;
                      });
                    },
                    child: payCheck
                        ? Image.asset('assets/icons/check.png')
                        : Image.asset('assets/icons/not check.png'),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'PayPal',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Intel',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset('assets/icons/paypal.png'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        cashCheck = !cashCheck;
                      });
                    },
                    child: cashCheck
                        ? Image.asset('assets/icons/check.png')
                        : Image.asset('assets/icons/not check.png'),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Cash Service (Orange,Vodafone,We)',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Intel',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset('assets/icons/cash.png'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        termCheck = !termCheck;
                      });
                    },
                    child: termCheck
                        ? Image.asset('assets/icons/green_check.png')
                        : Image.asset('assets/icons/not check.png'),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'You Accept Terms & Conditions',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Intel',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CreateDone.id);
                },
                child: Container(
                  width: 404,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xff2D5356),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Intel',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
