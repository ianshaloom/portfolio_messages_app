import '../../domain/repo/auth_repo.dart';
import '../datasource/message_auth_ds.dart';

class MessageAuthRepoImpl implements MessageAuthRepo {
  final MessageAuthDs messageAuthDs;
  MessageAuthRepoImpl({required this.messageAuthDs});

  @override
  Future<String> getMessageAccessAuth() async {
    return await messageAuthDs.getAuthToken();
  }
}
