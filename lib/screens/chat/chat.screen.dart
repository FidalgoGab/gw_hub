import 'package:flutter/material.dart';
import 'package:gw_hub/api/chat.api.dart';
import 'package:gw_hub/models/message.model.dart';
import 'package:gw_hub/ui/colors.dart';
import 'package:gw_hub/ui/widgets/chat_message.widget.dart';
import 'package:gw_hub/ui/widgets/text_input.widget.dart';
import 'package:signals/signals_flutter.dart';

class ChatScreen extends StatefulWidget {
  final bool hasAction;

  const ChatScreen({super.key, this.hasAction = true});

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  final messages = signal<List<MessageModel>>([
    MessageModel(
        text: 'Olá, tudo bem? Como posso te ajudar hoje?', sentByMe: false)
  ]);

  Future<void> getMessages(String message, bool sentByMe) async {
    List<MessageModel> messagesCp = [...messages.value];
    messagesCp.add(
      MessageModel(text: message, sentByMe: sentByMe),
    );
    messages.value = messagesCp;
    await Future.delayed(Duration(milliseconds: 100));
    _scrollToBottom();    _controller.clear();
    MessageModel answer = await ChatApi.getChatMessages(message);
    List<MessageModel> messagesCpAnswer = [...messages.value];
    messagesCpAnswer.add(answer);
    messages.value = messagesCpAnswer;
    await Future.delayed(Duration(milliseconds: 200));
    _scrollToBottom();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if(_scrollController.hasClients){
      final position = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        position,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !widget.hasAction ? null: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                if(widget.hasAction) {
                  Navigator.pop(context);
                }
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
                    controller: _scrollController,
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
                                        padding:
                                            const EdgeInsets.only(bottom: 24),
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
  }

  Widget bottomInputText() {
    return Container(
      color: inputWrapperBackground,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
                constraints:
                    const BoxConstraints(minHeight: 40, maxHeight: 168),
                child: TextInputWidget(
                  label: 'Mensagem',
                  controller: _controller,
                )),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () async {
              if (_controller.text.trim() != '') {
                await getMessages(_controller.text.trim(), true);
              }
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: redPrimary, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Icon(
                  // _controller.text.trim() == '' ? Icons.mic :
                   Icons.send,
                  color: whiteTypography,
                  size: 24,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
