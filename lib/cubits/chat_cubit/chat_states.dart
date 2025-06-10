abstract class ChatStates {
  final List<Map<String, dynamic>> messages;
  ChatStates({required this.messages});
}

//chat bot
class InitialChatStates extends ChatStates {
  InitialChatStates() : super(messages: []);
}

class ChatLoadingState extends ChatStates {
  ChatLoadingState({required super.messages});
}

class ChatSuccessState extends ChatStates {
  ChatSuccessState({required super.messages});
}

class ChatFailedState extends ChatStates {
  final String error;
  ChatFailedState({required this.error, required super.messages});
}

//init room
class InitRoomLoadingState extends ChatStates {
  InitRoomLoadingState({required super.messages});
}

class InitRoomSuccessState extends ChatStates {
  final String roomId;
  InitRoomSuccessState({required this.roomId, required super.messages});
}

class InitRoomFailedState extends ChatStates {
  final String error;
  InitRoomFailedState({required this.error, required super.messages});
}

//auction chat
class AuctionChatInitLoading extends ChatStates {
  AuctionChatInitLoading({required super.messages});
}

class AuctionChatInitSuccess extends ChatStates {
  final String roomId;
  AuctionChatInitSuccess({required this.roomId, required super.messages});
}

class AuctionMessageSending extends ChatStates {
  AuctionMessageSending({required super.messages});
}

class AuctionMessageSent extends ChatStates {
  AuctionMessageSent({required super.messages});
}
//Auction messages

class AuctionMessagesLoaded extends ChatStates {
  final List<Map<String, dynamic>> fetchedMessages;
  AuctionMessagesLoaded({
    required this.fetchedMessages,
    required super.messages,
  });
}
