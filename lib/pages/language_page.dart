import 'package:epicBid/pages/profile_page.dart';
import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});
  static String id = 'lang';

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
          'Language',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            child: Container(
              width: 404,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.only(
                  left: 18,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'English',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Container(
              width: 404,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Arabic',
                    style: TextStyle(
                      color: Colors.black,
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
