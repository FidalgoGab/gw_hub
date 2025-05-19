import 'package:flutter/material.dart';
import 'package:gw_hub/api/chat.api.dart';
import 'package:gw_hub/models/message.model.dart';
import 'package:gw_hub/models/screen/chat.model.dart';
import 'package:gw_hub/ui/colors.dart';
import 'package:gw_hub/ui/widgets/chat_message.widget.dart';
import 'package:gw_hub/ui/widgets/text_input.widget.dart';
import 'package:signals/signals_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messages = signal<List<MessageModel>>([]);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChatModel>(
        future: ChatApi.getChatMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(child: LinearProgressIndicator()));
          }

          if (snapshot.error != null) {
            return const Scaffold(
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ocorreu um erro, tente novamente mais tarde')
                  ]),
            );
          }

          ChatModel chatData = snapshot.data!;
          messages.value = chatData.messages;

          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: whiteTypography,
                      size: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    'EnergIA',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
            ),
            body: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Column(children: [
                  Expanded(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: SingleChildScrollView(
                          controller: null,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 24.0, left: 24.0, right: 24.0),
                              child: SizedBox(
                                  child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: messages
                                        .watch(context)
                                        .map((e) => Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 24),
                                              child: Row(
                                                mainAxisAlignment: e.sentByMe
                                                    ? MainAxisAlignment.end
                                                    : MainAxisAlignment.start,
                                                children: [
                                                  ChatMessage(
                                                    text: e.text,
                                                    owner: e.sentByMe,
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ))),
                        )),
                  ),
                  bottomInputText()
                ])),
          );
        });
  }

  Widget bottomInputText() {
    return Container(
      color: inputText,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                constraints:
                    const BoxConstraints(minHeight: 40, maxHeight: 168),
                child: TextInputWidget(label: 'Mensagem')),
          ),
          const SizedBox(
            width: 8,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: redPrimary, borderRadius: BorderRadius.circular(8)),
            child: const Center(
              child: Icon(
                Icons.send,
                color: whiteTypography,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
