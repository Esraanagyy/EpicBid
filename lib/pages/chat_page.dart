import 'package:epicBid/pages/auction_details_page.dart';
import 'package:epicBid/widgets/seller_chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id='chat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, AuctionDetailsPage.id);
            },
            child: const ImageIcon(
                AssetImage('assets/icons/arrow.png'),
            ),
          ),
        ),
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "Auction Chat",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Intel',
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "Online",
              style: TextStyle(
                color: Color(0xff656565),
                fontFamily: 'Intel',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Image.asset('assets/icons/phone.png'),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return   SellerChatBubble(text: 'hello');
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          width: 430,
        height: 62,
       color: const Color(0xffCCCCCC),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/icons/image.png'),
            Image.asset('assets/icons/mic.png'),
            Container(
              width: 305,
              height: 43,
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Image.asset('assets/icons/emoji.png'),
                  hintText: 'Add your Message Here',
                  hintStyle: const TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Intel',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(20),
                  )
                ),
              ),
            ),
            Image.asset('assets/icons/like.png'),
          ],
        )
      ),
    );
  }
}
