import '../../domain/entity/message_response.dart';
import '../../domain/repo/port_messages_repo.dart';
import '../datasource/port_messages_ds.dart';
import '../model/message_response_model.dart';

class PortMessageRepoImpl implements PortMessageRepo {
  final MessagesDs messagesDs;
  PortMessageRepoImpl(this.messagesDs);

  @override
  Future<List<MessageResponse>> getMessages() async {
    final List<MessageResponseModel> messages = await messagesDs.getMessages();

    return messages.map((e) => MessageResponse.fromModel(e)).toList();
  }
}
