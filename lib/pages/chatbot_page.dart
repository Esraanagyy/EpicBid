import 'package:epicBid/cubits/chat_cubit/chat_cubit.dart';
import 'package:epicBid/cubits/chat_cubit/chat_states.dart';
import 'package:epicBid/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/app_localizations.dart';
import '../widgets/chat_bubble.dart';

class ChatBotPage extends StatelessWidget {
  const ChatBotPage({super.key});
  static String id = 'chatbot';

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const ImageIcon(AssetImage('assets/icons/arrow.png')),
            onPressed: () => Navigator.pushNamed(context, HomePage.id),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              lang?.chatbot ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Intel',
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              lang?.online ?? '',
              style: const TextStyle(
                color: Color(0xff656565),
                fontFamily: 'Intel',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Image.asset('assets/icons/phone.png'),
            onPressed: () {
              // Add phone call functionality
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => ChatCubit(),
        child: _ChatBotBody(),
      ),
    );
  }
}

class _ChatBotBody extends StatefulWidget {
  @override
  State<_ChatBotBody> createState() => _ChatBotBodyState();
}

class _ChatBotBodyState extends State<_ChatBotBody> {
  final TextEditingController messageController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  late String sessionId;

  @override
  void initState() {
    super.initState();
    sessionId = 'session_${DateTime.now().millisecondsSinceEpoch}';
  }

  @override
  void dispose() {
    messageController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        Expanded(
          child: BlocConsumer<ChatCubit, ChatStates>(
            listener: (context, state) {
              if (state is ChatFailedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              final chatCubit = context.read<ChatCubit>();

              if (state is ChatLoadingState && chatCubit.messages.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.symmetric(vertical: 8),
                itemCount: chatCubit.messages.length,
                itemBuilder: (context, index) {
                  final message = chatCubit.messages.reversed.toList()[index];
                  return ChatBubble(
                    text: message['text'],
                    isUser: message['isUser'],
                  );
                },
              );
            },
          ),
        ),
        _buildInputArea(context),
      ],
    );
  }

  Widget _buildInputArea(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      color: const Color(0xffCCCCCC),
      child: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/icons/image.png'),
            onPressed: () {
              // Add image picker functionality
            },
          ),
          IconButton(
            icon: Image.asset('assets/icons/mic.png'),
            onPressed: () {
              // Add voice message functionality
            },
          ),
          Expanded(
            child: TextField(
              controller: messageController,
              focusNode: focusNode,
              textCapitalization: TextCapitalization.sentences,
              minLines: 1,
              maxLines: 3,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                prefixIcon: IconButton(
                  icon: Image.asset('assets/icons/emoji.png'),
                  onPressed: () {
                    // Add emoji picker
                  },
                ),
                hintText: lang?.typeYourMessage,
                hintStyle: const TextStyle(
                  color: Color(0xff4C4C4C),
                  fontFamily: 'Intel',
                  fontSize: 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (text) => _sendMessage(context, text),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.send,
              color: Color(0xff2D5356),
              size: 30,
            ),
            onPressed: () {
              if (messageController.text.trim().isNotEmpty) {
                _sendMessage(context, messageController.text);
              }
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context, String text) {
    final message = text.trim();
    if (message.isEmpty) return;

    final chatCubit = context.read<ChatCubit>();
    chatCubit.chatBotServices(
      sessionId: sessionId,
      userMessage: message,
    );

    messageController.clear();
  }
}
