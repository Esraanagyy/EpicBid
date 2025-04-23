import 'package:epicBid/pages/profile_page.dart';
import 'package:epicBid/widgets/drop_down_widget.dart';
import 'package:epicBid/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  AddressPage({super.key});
  static String id='address';
  final List<String> _city = [
    '',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
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
            padding: EdgeInsets.only(top: 20,left: 18),
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
          const SizedBox(height: 10,),
          DropDownWidget(
              items: _city,
            listName: 'City',
          ),
          const SizedBox(height: 10,),
          TextFormFieldWidget(text: 'Address'),
          const SizedBox(height: 10,),
          TextFormFieldWidget(text: 'Zip Code'),

          Padding(
            padding: const EdgeInsets.only(top: 30,left: 160),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, ProfilePage.id);
              },
              child: Container(
                width: 124,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xff2D5356),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    'Edit Profile',
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
