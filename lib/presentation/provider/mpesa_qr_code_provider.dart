import 'package:flutter/material.dart';

import '../../data/datasource/port_messages_ds.dart';
import '../../data/datasource/port_messages_remote_ds.dart';
import '../../data/repo/port_messages_repo_impl.dart';
import '../../domain/entity/message_response.dart';
import '../../domain/repo/port_messages_repo.dart';
import 'mpesa_qr_code_mixin.dart';

class MpesaQrCodeProvider extends ChangeNotifier with MpesaQrCodeMixin {
  static MessagesDs datasourceGenerate = MessagesRemoteDs();
  final PortMessageRepo generateRepo = PortMessageRepoImpl(
    datasourceGenerate,
  );

  Future<List<MessageResponse>> getMessages() async {
    try {
      final List<MessageResponse> messages = await generateRepo.getMessages();
      return messages;
    } catch (e) {
      throw Exception('Failed to Fetch Messages');
    }
  }

  MpesaQrCodeProvider._();
  static final MpesaQrCodeProvider _instance = MpesaQrCodeProvider._();
  factory MpesaQrCodeProvider() => _instance;
}
