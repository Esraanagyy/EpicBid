import 'package:epicBid/cubits/chat_cubit/chat_cubit.dart';
import 'package:epicBid/cubits/chat_cubit/chat_states.dart';
import 'package:epicBid/pages/auction_details_page.dart';
import 'package:epicBid/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/app_localizations.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'chat';

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final productId = args['productId']?.toString() ?? 'default_id';
    final imagePath = args['image']?.toString() ?? 'assets/default_product.png';
    final TextEditingController messageController = TextEditingController();

    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.024; // 10/420 ≈ 0.024

    return BlocProvider(
      create: (context) => ChatCubit()..initAuctionRoom(productId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: EdgeInsets.only(left: padding),
            child: InkWell(
              onTap: () {
                final intProductId = int.tryParse(productId) ?? 0;
                Navigator.pushNamed(
                  context,
                  AuctionDetailsPage.id,
                  arguments: {
                    'id': intProductId,
                    'image': imagePath,
                  },
                );
              },
              child: ImageIcon(
                const AssetImage('assets/icons/arrow.png'),
                size: size.width * 0.06, // Scaled icon size
              ),
            ),
          ),
          centerTitle: true,
          title: Column(
            children: [
              Text(
                lang?.auctionChat ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Intel',
                  fontSize: size.width * 0.052, // 22/420 ≈ 0.052
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                lang?.online ?? '',
                style: TextStyle(
                  color: const Color(0xff656565),
                  fontFamily: 'Intel',
                  fontSize: size.width * 0.033, // 14/420 ≈ 0.033
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: padding),
              child: InkWell(
                child: Image.asset(
                  'assets/icons/phone.png',
                  width: size.width * 0.06,
                ),
              ),
            ),
          ],
        ),
        body: BlocConsumer<ChatCubit, ChatStates>(
          listener: (context, state) {
            if (state is ChatFailedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            final chatCubit = context.read<ChatCubit>();

            return Column(
              children: [
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(bottom: padding),
                    itemCount: chatCubit.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatCubit.messages[index];
                      return ChatBubble(
                        text: message['text'],
                        isUser: message['isUser'] ?? false,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: Container(
          width: size.width, // 430 → size.width
          height: size.width * 0.148, // 62/420 ≈ 0.148
          color: const Color(0xffCCCCCC),
          child: BlocBuilder<ChatCubit, ChatStates>(
            builder: (context, state) {
              final chatCubit = context.read<ChatCubit>();
              final username = 'current_user'; // Replace with actual username

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/icons/image.png',
                    width: size.width * 0.06,
                  ),
                  Image.asset(
                    'assets/icons/mic.png',
                    width: size.width * 0.06,
                  ),
                  SizedBox(
                    width: size.width * 0.73, // 305/420 ≈ 0.726
                    height: size.width * 0.102, // 43/420 ≈ 0.102
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Image.asset(
                          'assets/icons/emoji.png',
                          width: size.width * 0.06,
                        ),
                        hintText: lang?.addYourMessageHere,
                        hintStyle: TextStyle(
                          color: const Color(0xff4C4C4C),
                          fontFamily: 'Intel',
                          fontSize: size.width * 0.038, // 16/420 ≈ 0.038
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              size.width * 0.048), // 20/420 ≈ 0.048
                        ),
                      ),
                      onSubmitted: (text) {
                        if (text.trim().isNotEmpty) {
                          chatCubit.sendAuctionMessage(
                            message: text,
                            roomName: 'product_$productId',
                            username: username,
                          );
                          messageController.clear();
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: Color(0xff2D5356),
                    ),
                    onPressed: () {
                      if (messageController.text.trim().isNotEmpty) {
                        chatCubit.sendAuctionMessage(
                          message: messageController.text,
                          roomName: 'product_$productId',
                          username: username,
                        );
                        messageController.clear();
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
