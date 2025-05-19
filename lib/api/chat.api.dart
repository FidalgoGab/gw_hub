import 'package:gw_hub/models/message.model.dart';
import 'package:gw_hub/models/screen/chat.model.dart';

class ChatApi {
  static Future<ChatModel> getChatMessages() async {
    await Future.delayed(const Duration(milliseconds: 800));

    List<MessageModel> messages = const [
      MessageModel(text: 'Olá, tudo bem? ', sentByMe: true),
      MessageModel(text: 'Olá, tudo sim, e com vc? ', sentByMe: false),
      MessageModel(text: 'Tudo joia, obrigado', sentByMe: true),
      MessageModel(text: 'Olá, tudo bem? ', sentByMe: true),
      MessageModel(text: 'Olá, tudo sim, e com vc? ', sentByMe: false),
      MessageModel(text: 'Tudo joia, obrigado', sentByMe: true),
      MessageModel(text: 'Olá, tudo bem? ', sentByMe: true),
      MessageModel(text: 'Olá, tudo sim, e com vc? ', sentByMe: false),
      MessageModel(text: 'Tudo joia, obrigado', sentByMe: true),
      MessageModel(text: 'Olá, tudo bem? ', sentByMe: true),
      MessageModel(text: 'Olá, tudo sim, e com vc? ', sentByMe: false),
      MessageModel(text: 'Tudo joia, obrigado', sentByMe: true),
    ];

    return ChatModel(messages: messages);
  }
}
