import 'package:flutter/foundation.dart';

@immutable
class MessageResponseModel {
  final String id;
  final String name;
  final String email;
  final String project;
  final String message;
  final String date;

  const MessageResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.project,
    required this.message,
    required this.date,
  });

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) {
    return MessageResponseModel(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      project: json['project'],
      message: json['message'],
      date: json['created_at'],
    );
  }
}
