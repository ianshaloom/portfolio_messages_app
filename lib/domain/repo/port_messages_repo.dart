import '../entity/message_response.dart';

abstract class PortMessageRepo {
  Future<List<MessageResponse>> getMessages();
}
