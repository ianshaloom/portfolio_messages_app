import '../../domain/repo/auth_repo.dart';

mixin MpesaQrCodeMixin {
  Future<String> getQrMpesaAuth(MessageAuthRepo repo) async {
    return await repo.getMessageAccessAuth();
  }
}
