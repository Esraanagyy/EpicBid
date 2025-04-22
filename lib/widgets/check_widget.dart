import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,left: 40,right: 40),
      child: Container(
        width: 360,
        height: 192,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(36),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'Order Summary',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Text(
                 'Sub Total',
                 style: TextStyle(
                   color: Colors.white,
                   fontFamily: 'Inter',
                   fontSize: 16,
                   fontWeight: FontWeight.w400,
                 ),
               ),
               Text(
                 '5200 LE',
                 style: TextStyle(
                   color: Colors.white,
                   fontFamily: 'Inter',
                   fontSize: 16,
                   fontWeight: FontWeight.w500,
                 ),
               ),
             ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Shipping Free',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '00.00 LE',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '5200 LE',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
