import 'package:flutter/material.dart';
import 'package:gw_hub/ui/navigators/app_bar.navigator.dart';
import 'package:gw_hub/ui/navigators/bottom_bar.navigator.dart';
import 'package:signals/signals_flutter.dart';

class BaseLayout extends StatelessWidget {
  final Widget body;
  final String title;

  const BaseLayout({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    final currentTab = signal(0);

    return SafeArea(
        child: Scaffold(
      appBar: AppBarNavigator().getAppBar(
          title,
          'https://s2-oglobo.glbimg.com/RxvRKNHvx9PhitTDbg8mkXp5P_E=/107x0:661x400/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2025/Q/U/UwAyNcR6AUDNDuoaVodg/divulgacao.png',
          context),
      body: body,
      bottomNavigationBar: BottomBarNavigator()
          .getBottomBar(context, currentTab.value, (tabIndex) {
        currentTab.value = tabIndex;
        print(currentTab.value);
      }),
    ));
  }
}
