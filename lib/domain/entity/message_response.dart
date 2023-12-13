import 'package:flutter/foundation.dart';

import '../../data/model/message_response_model.dart';

@immutable
class MessageResponse {
  final String id;
  final String name;
  final String email;
  final String project;
  final String message;
  final DateTime date;

  const MessageResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.project,
    required this.message,
    required this.date,
  });

  factory MessageResponse.fromModel(MessageResponseModel qrMpesaResponse) {
    return MessageResponse(
      id: qrMpesaResponse.id,
      name: qrMpesaResponse.name,
      email: qrMpesaResponse.email,
      project: qrMpesaResponse.project,
      message: qrMpesaResponse.message,
      date: DateTime.parse(qrMpesaResponse.date),
    );
  }
}
