import 'package:epicBid/pages/profile_page.dart';
import 'package:flutter/material.dart';

class CreateDone extends StatelessWidget {
  const CreateDone({super.key});
  static String id ='done';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 300),
            const Text(
              'Auction Created',
              style: TextStyle(
                color: Color(0xff2D5356),
                fontFamily: 'Inter',
                fontSize: 52,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 100),
            const Text(
              'Look for details in Your Profile',
              style: TextStyle(
                color: Color(0xff4C4C4C),
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: ()
              {
                Navigator.pushNamed(context, ProfilePage.id);
              },
              child: Container(
                width: 200,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xff2D5356),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/icons/left_double_arrow.png'),
                      const Text(
                        'Go To Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
