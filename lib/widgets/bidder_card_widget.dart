import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BidderCardWidget extends StatelessWidget {
  final String userName;
  final double bidAmount;
  final DateTime createdAt;

  const BidderCardWidget({
    super.key,
    required this.userName,
    required this.bidAmount,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffF7E072),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(
                    color: Color(0xff2D5356),
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('MMM d, y - h:mm a').format(createdAt),
                  style: const TextStyle(
                    color: Color(0xff2D5356),
                    fontFamily: 'Inter',
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Text(
              '\$${bidAmount.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Color(0xff2D5356),
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
