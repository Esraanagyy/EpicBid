import 'dart:io';

import 'package:epicBid/pages/auction_page.dart';
import 'package:epicBid/pages/create_done.dart';
import 'package:epicBid/widgets/credit_card_widget.dart';
import 'package:epicBid/widgets/drop_down_widget.dart';
import 'package:epicBid/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Auction {
  final String name;
  final String status;
  final String productType;
  final String auctionTime;
  final String productColor;
  final String productSize;
  final String auctionType;
  final String city;
  final String address;
  final String zipCode;
  final String paymentMethod;
  final String? image;
  final String price;
  final Color color;

  Auction({
    required this.name,
    required this.status,
    required this.productType,
    required this.auctionTime,
    required this.productColor,
    required this.productSize,
    required this.auctionType,
    required this.city,
    required this.address,
    required this.zipCode,
    required this.paymentMethod,
    this.image,
    required this.price,
    required this.color,
  });
}

class AuctionData {
  static List<Auction> auctions = [];
}

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

  // Controllers for text fields
  final TextEditingController _auctionNameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _productSizeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // Selected values for dropdowns
  String? _selectedProductType;
  String? _selectedAuctionTime;
  String? _selectedProductColor;
  String? _selectedAuctionType;
  String? _selectedCity;

  // Image picker
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  // Static dropdown data
  final List<String> _productType = [
    'Chairs',
    'Pillows',
    'Circular Tables',
    'Tables',
    'Lamps',
    'Couches',
  ];
  final List<String> _auctionTime = ['1 Hour', '2 Hours', '3 Hours'];
  final List<String> _productColor = [
    'Red',
    'Yellow',
    'Blue',
    'Green',
    'Purple',
    'Black',
    'White',
    'Orange',
    'Pink',
    'Grey',
  ];
  final List<String> _auctionType = ['Public', 'Private'];
  final List<String> _city = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Aswan',
    'Asyut',
    'Beheira',
    'Beni Suef',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharbia',
    'Ismailia',
    'Kafr El Sheikh',
    'Luxor',
    'Matruh',
    'Minya',
    'Monufia',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Qalyubia',
    'Qena',
    'Red Sea',
    'Sharqia',
    'Sohag',
    'South Sinai',
    'Suez',
  ];

  @override
  void dispose() {
    _auctionNameController.dispose();
    _statusController.dispose();
    _productSizeController.dispose();
    _addressController.dispose();
    _zipCodeController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  void _createAuction() {
    if (_auctionNameController.text.isEmpty ||
        _statusController.text.isEmpty ||
        _selectedProductType == null ||
        _selectedAuctionTime == null ||
        _selectedProductColor == null ||
        _productSizeController.text.isEmpty ||
        _selectedAuctionType == null ||
        _selectedCity == null ||
        _addressController.text.isEmpty ||
        _zipCodeController.text.isEmpty ||
        _priceController.text.isEmpty ||
        !(visaCheck || payCheck || cashCheck) ||
        !termCheck) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill all fields and accept terms')),
      );
      return;
    }

    // Validate price is a positive number
    final priceValue = double.tryParse(_priceController.text);
    if (priceValue == null || priceValue <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid price')),
      );
      return;
    }

    String paymentMethod = visaCheck
        ? 'Credit Card'
        : payCheck
            ? 'PayPal'
            : 'Cash Service';

    // Format price with 'Le' suffix
    String price = '${_priceController.text} Le';

    Color color = _selectedProductColor == 'Red'
        ? const Color(0xffCA9991)
        : _selectedProductColor == 'Yellow'
            ? const Color(0xffF7E072)
            : _selectedProductColor == 'Blue'
                ? const Color(0xff0087A8)
                : _selectedProductColor == 'Green'
                    ? const Color(0xff4CAF50)
                    : _selectedProductColor == 'Purple'
                        ? const Color(0xff9C27B0)
                        : _selectedProductColor == 'Black'
                            ? const Color(0xff000000)
                            : _selectedProductColor == 'White'
                                ? const Color(0xffFFFFFF)
                                : _selectedProductColor == 'Orange'
                                    ? const Color(0xffFF9800)
                                    : _selectedProductColor == 'Pink'
                                        ? const Color(0xffF06292)
                                        : const Color(0xff9E9E9E); // Grey

    Auction newAuction = Auction(
      name: _auctionNameController.text,
      status: _statusController.text,
      productType: _selectedProductType!,
      auctionTime: _selectedAuctionTime!,
      productColor: _selectedProductColor!,
      productSize: _productSizeController.text,
      auctionType: _selectedAuctionType!,
      city: _selectedCity!,
      address: _addressController.text,
      zipCode: _zipCodeController.text,
      paymentMethod: paymentMethod,
      image: _selectedImage?.path,
      price: price,
      color: color,
    );

    AuctionData.auctions.add(newAuction);

    Navigator.pushNamed(context, CreateDone.id);
  }

  @override
  Widget build(BuildContext context) {
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
            // Image picker section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Product Image',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Intel',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: _pickImage,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _selectedImage != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Tap to select image',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Intel',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            TextFormFieldWidget(
              text: 'Auction Name',
              controller: _auctionNameController,
            ),
            TextFormFieldWidget(
              text: 'Status',
              controller: _statusController,
            ),
            DropDownWidget(
              items: _productType,
              listName: 'Product Type',
              onChanged: (value) =>
                  setState(() => _selectedProductType = value),
            ),
            DropDownWidget(
              items: _auctionTime,
              listName: 'Auction Time',
              onChanged: (value) =>
                  setState(() => _selectedAuctionTime = value),
            ),
            DropDownWidget(
              items: _productColor,
              listName: 'Product Color',
              onChanged: (value) =>
                  setState(() => _selectedProductColor = value),
            ),
            TextFormFieldWidget(
              text: 'Product Size',
              controller: _productSizeController,
            ),
            TextFormFieldWidget(
              text: 'Starting Price (Le)',
              controller: _priceController,
              keyboardType: TextInputType.number,
            ),
            DropDownWidget(
              items: _auctionType,
              listName: 'Auction Type',
              onChanged: (value) =>
                  setState(() => _selectedAuctionType = value),
            ),
            DropDownWidget(
              items: _city,
              listName: 'City',
              onChanged: (value) => setState(() => _selectedCity = value),
            ),
            TextFormFieldWidget(
              text: 'Address',
              controller: _addressController,
            ),
            TextFormFieldWidget(
              text: 'Zip Code',
              controller: _zipCodeController,
            ),
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
                        payCheck = false;
                        cashCheck = false;
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
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                              top: 20,
                              left: 16,
                              right: 16,
                            ),
                            child: const CreditCardWidget(),
                          );
                        },
                      );
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
                        visaCheck = false;
                        cashCheck = false;
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
                        visaCheck = false;
                        payCheck = false;
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
              padding: const EdgeInsets.only(left: 18, top: 16),
              child: InkWell(
                onTap: _createAuction,
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
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
