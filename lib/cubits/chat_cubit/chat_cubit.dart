import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:epicBid/cubits/chat_cubit/chat_states.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(InitialChatStates());

  //chat bot
  List<Map<String, dynamic>> messages = [];

  Future<void> chatBotServices(
      {required String sessionId, required String userMessage}) async {
    try {
      emit(ChatLoadingState(messages: messages));

      // Add user message
      messages.add({
        'text': userMessage,
        'isUser': true,
        'timestamp': DateTime.now(),
      });
      emit(ChatSuccessState(messages: List.from(messages)));

      final Response response = await http
          .post(
            Uri.parse('http://ebic-bid11.runasp.net/api/ChatBot/chatbot'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'sessionId': sessionId,
              'userMessage': userMessage,
            }),
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final botResponse = responseBody['reply'] ?? 'No response from bot';

        messages.add({
          'text': botResponse,
          'isUser': false,
          'timestamp': DateTime.now(),
        });
        emit(ChatSuccessState(messages: List.from(messages)));
      } else {
        throw Exception('API returned status ${response.statusCode}');
      }
    } catch (e) {
      messages.add({
        'text': 'Error: ${e.toString()}',
        'isUser': false,
        'timestamp': DateTime.now(),
      });
      emit(ChatFailedState(error: e.toString(), messages: messages));
    }
  }

//init room
  Future<void> initRoom(String productId) async {
    try {
      emit(InitRoomLoadingState(messages: messages));

      final response = await http.post(
        Uri.parse(
            'http://ebic-bid-auctionchat.runasp.net/api/chat/init-room?productId=$productId'),
        headers: {'Content-Type': 'application/json'},
      );

      final responseBody = jsonDecode(response.body);

      if (response.statusCode == 200 && responseBody['success'] == true) {
        emit(InitRoomSuccessState(
          roomId: responseBody['room'],
          messages: messages, // Preserve existing messages
        ));
      } else {
        emit(InitRoomFailedState(
          error: 'Failed to initialize room',
          messages: messages,
        ));
      }
    } catch (e) {
      emit(InitRoomFailedState(
        error: e.toString(),
        messages: messages,
      ));
    }
  }

  //send messages
// Add to your existing ChatCubit class
  Future<void> initAuctionRoom(String productId) async {
    try {
      emit(AuctionChatInitLoading(messages: messages));

      final response = await http.post(
        Uri.parse(
            'http://ebic-bid-auctionchat.runasp.net/api/chat/init-room?productId=$productId'),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data['success'] == true) {
        emit(AuctionChatInitSuccess(
          roomId: data['room'] ?? 'default_room',
          messages: messages,
        ));
      } else {
        throw Exception(data['error'] ?? 'Room initialization failed');
      }
    } catch (e) {
      emit(ChatFailedState(
        error: 'Auction init error: ${e.toString()}',
        messages: messages,
      ));
    }
  }

  Future<void> sendAuctionMessage(
      {required String message,
      required String roomName,
      required String username}) async {
    try {
      emit(AuctionMessageSending(messages: messages));

      final uri =
          Uri.parse('http://ebic-bid-auctionchat.runasp.net/api/chat/send'
              '?message=${Uri.encodeComponent(message)}'
              '&roomName=${Uri.encodeComponent(roomName)}'
              '&username=${Uri.encodeComponent(username)}');

      final response = await http.post(uri);
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        // Add message to your existing messages list
        messages.add({
          'text': message,
          'isUser': true,
          'room': roomName,
          'timestamp': DateTime.now().toString(),
        });
        emit(AuctionMessageSent(messages: messages));
      } else {
        throw Exception(data['error'] ?? 'Message send failed');
      }
    } catch (e) {
      emit(ChatFailedState(
        error: 'Auction send error: ${e.toString()}',
        messages: messages,
      ));
    }
  }

  //Auction messages
  Future<void> fetchAuctionMessages({
    required String roomName,
    int maxCount = 50,
  }) async {
    try {
      emit(ChatLoadingState(messages: messages));

      final response = await http.get(
        Uri.parse('http://ebic-bid-auctionchat.runasp.net/api/chat/messages/'
            '?roomName=${Uri.encodeComponent(roomName)}'
            '&maxCount=$maxCount'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        // Convert API response to your message format
        final List<Map<String, dynamic>> fetchedMessages =
            responseData.map((msg) {
          return {
            'text': msg['message'],
            'isUser':
                msg['user'] == 'current_username', // You'll need to set this
            'username': msg['user'],
            'timestamp': msg['timestamp'],
          };
        }).toList();

        emit(AuctionMessagesLoaded(
          fetchedMessages: fetchedMessages,
          messages: messages,
        ));
      } else {
        throw Exception('Failed to load messages: ${response.statusCode}');
      }
    } catch (e) {
      emit(ChatFailedState(
        error: 'Fetch error: ${e.toString()}',
        messages: messages,
      ));
    }
  }
}
