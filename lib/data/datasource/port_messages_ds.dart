import '../model/message_response_model.dart';

abstract class MessagesDs {
  // get qr code
  Future<List<MessageResponseModel>> getMessages();
}
