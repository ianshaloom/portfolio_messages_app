import 'package:flutter/foundation.dart';

@immutable
class MessageRequest {
  final String id;
  final String name;
  final String email;
  final String project;
  final String message;
  final DateTime date;

  const MessageRequest({
    required this.id,
    required this.name,
    required this.email,
    required this.project,
    required this.message,
    required this.date,
  });

  // to json
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "project": project,
      "message": message,
      "date": date,
    };
  }
}
