import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../model/message_response_model.dart';
import 'port_messages_ds.dart';

class MessagesRemoteDs implements MessagesDs {
  @override
  Future<List<MessageResponseModel>> getMessages() async {
    // get method

    try {
      final response = await http.get(Uri.parse(messagesUrl));

      if (response.statusCode != 200) {
        throw Exception('Server error');
      }

      final List<MessageResponseModel> messageResponseModels =
          (jsonDecode(response.body) as List)
              .map((e) => MessageResponseModel.fromJson(e))
              .toList();

      return messageResponseModels;
    } catch (_) {
      throw Exception('Failed to Fetch Messages');
    }
  }
}
