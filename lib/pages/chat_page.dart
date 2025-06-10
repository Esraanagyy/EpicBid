import 'package:epicBid/cubits/chat_cubit/chat_cubit.dart';
import 'package:epicBid/cubits/chat_cubit/chat_states.dart';
import 'package:epicBid/pages/auction_details_page.dart';
import 'package:epicBid/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});
  static String id = 'chat';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final productId = args['productId']?.toString() ?? 'default_id';
    final TextEditingController messageController = TextEditingController();

    return BlocProvider(
      create: (context) => ChatCubit()..initAuctionRoom(productId),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, AuctionDetailsPage.id),
              child: const ImageIcon(AssetImage('assets/icons/arrow.png')),
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
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset('assets/icons/phone.png'),
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
                    padding: const EdgeInsets.only(bottom: 10),
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
          width: 430,
          height: 62,
          color: const Color(0xffCCCCCC),
          child: BlocBuilder<ChatCubit, ChatStates>(
            builder: (context, state) {
              final chatCubit = context.read<ChatCubit>();
              final username = 'current_user'; // Replace with actual username

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/icons/image.png'),
                  Image.asset('assets/icons/mic.png'),
                  SizedBox(
                    width: 305,
                    height: 43,
                    child: TextField(
                      controller: messageController,
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
                    icon: Image.asset('assets/icons/like.png'),
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
