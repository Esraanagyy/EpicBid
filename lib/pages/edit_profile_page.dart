import 'package:epicBid/pages/profile_page.dart';
import 'package:epicBid/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});
  static String id='edit';

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
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, ProfilePage.id);
              },
              child: Image.asset(
                  'assets/icons/done.png'
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Image.asset('assets/images/profile.png'),
                  Image.asset('assets/icons/edit_image.png'),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            TextFormFieldWidget(text: 'Your Name'),
            const SizedBox(height: 10,),
            TextFormFieldWidget(text: 'Email Address'),
            const SizedBox(height: 10,),
            TextFormFieldWidget(text: 'User Name'),
            const SizedBox(height: 10,),
            TextFormFieldWidget(text: 'Password'),
            TextFormFieldWidget(text: 'phone Number'),
          ],
        ),
      ),
    );
  }
}
