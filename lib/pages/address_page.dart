import 'package:epicBid/pages/profile_page.dart';
import 'package:epicBid/services/snack_bar_service.dart';
import 'package:epicBid/widgets/drop_down_widget.dart';
import 'package:epicBid/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class Address {
  final String city;
  final String address;
  final String zipCode;

  Address({
    required this.city,
    required this.address,
    required this.zipCode,
  });
}

class AddressData {
  static List<Address> addresses = [];
}

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});
  static String id = 'address';

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  // Controllers for text fields
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  // Selected value for dropdown
  String? _selectedCity;

  // Egyptian cities
  final List<String> _city = [
    'Cairo',
    'Alexandria',
    'Giza',
    'Aswan',
    'Asyte',
    'Beheira',
    'Beni Suef',
    'Dakahlia',
    'Damietta',
    'Faiyum',
    'Gharib',
    'Ismail',
    'after El Sheikh',
    'Luxor',
    'Matriarch',
    'Mina',
    'Monia',
    'New Valley',
    'North Sinai',
    'Port Said',
    'Cubically',
    'Pena',
    'Red Sea',
    'Sharia',
    'So hag',
    'South Sinai',
    'Suez',
  ];

  @override
  void dispose() {
    _addressController.dispose();
    _zipCodeController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    if (_selectedCity == null ||
        _addressController.text.isEmpty ||
        _zipCodeController.text.isEmpty) {
      SnackBarService.showErrorMessage('Please fill all fields');
      return;
    }

    Address newAddress = Address(
      city: _selectedCity!,
      address: _addressController.text,
      zipCode: _zipCodeController.text,
    );

    AddressData.addresses.add(newAddress);
    SnackBarService.showSuccessMessage('Address added successfully!');

    Navigator.pushNamed(context, ProfilePage.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProfilePage.id);
          },
          child: Image.asset('assets/icons/arrow.png'),
        ),
        title: const Text(
          'Address',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 18),
            child: Text(
              'First Address',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
          DropDownWidget(
            items: _city,
            listName: 'City',
            onChanged: (value) => setState(() => _selectedCity = value),
          ),
          const SizedBox(height: 10),
          TextFormFieldWidget(
            text: 'Address',
            controller: _addressController,
          ),
          const SizedBox(height: 10),
          TextFormFieldWidget(
            text: 'Zip Code',
            controller: _zipCodeController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 160),
            child: InkWell(
              onTap: _saveAddress,
              child: Container(
                width: 124,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xff2D5356),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Save Address',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
