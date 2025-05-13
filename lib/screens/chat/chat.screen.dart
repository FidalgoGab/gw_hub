import 'package:flutter/material.dart';
import 'package:gw_hub/api/devices.api.dart';
import 'package:gw_hub/models/screen/devices.model.dart';
import 'package:gw_hub/screens/profile/profile.screen.dart';
import 'package:gw_hub/ui/navigators/app_bar.navigator.dart';
import 'package:gw_hub/ui/widgets/chat_message.widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DevicesModel>(
        future: DevicesApi.getDevicesList(),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBarNavigator().getAppBar(
              'GW Hub',
              'https://s2-oglobo.glbimg.com/RxvRKNHvx9PhitTDbg8mkXp5P_E=/107x0:661x400/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2025/Q/U/UwAyNcR6AUDNDuoaVodg/divulgacao.png',
              context,
              () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Column(
                      children: ['Olá tudo bem?', 'Sim e vc?']
                          .map(
                            (msg) => Align(
                              alignment: msg.length > 9
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: ChatMessage(
                                text: msg,
                                owner: msg.length > 9,
                              ),
                            ),
                          )
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
