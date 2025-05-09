import 'package:flutter/material.dart';
import 'package:gw_hub/screens/devices/devices.screen.dart';
import 'package:gw_hub/screens/home/home.screen.dart';
import 'package:gw_hub/screens/profile/profile.screen.dart';
import 'package:gw_hub/ui/navigators/app_bar.navigator.dart';
import 'package:gw_hub/ui/navigators/bottom_bar.navigator.dart';
import 'package:signals/signals_flutter.dart';

class BaseLayout extends StatefulWidget {
  final Widget body;
  final String title;
  final int currentPage;

  const BaseLayout({
    super.key,
    required this.body,
    required this.title,
    required this.currentPage,
  });

  @override
  State<StatefulWidget> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  final currentTab = signal(0);

  @override
  void initState() {
    currentTab.value = widget.currentPage;
    super.initState();
  }

  @override
  void dispose() {
    currentTab.value = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBarNavigator().getAppBar(
          widget.title,
          'https://s2-oglobo.glbimg.com/RxvRKNHvx9PhitTDbg8mkXp5P_E=/107x0:661x400/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2025/Q/U/UwAyNcR6AUDNDuoaVodg/divulgacao.png',
          context, () {
        if (currentTab.value != 3) {
          currentTab.value = 3;
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
        }
      }),
      body: widget.body,
      bottomNavigationBar: BottomBarNavigator()
          .getBottomBar(context, currentTab.watch(context), (tabIndex) {
        if (currentTab.value != tabIndex) {
          currentTab.value = tabIndex;
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => currentTab.value == 0
                      ? const HomeScreen()
                      : currentTab.value == 2
                          ? const DevicesScreen()
                          : const ProfileScreen()));
        }
      }),
    ));
  }
}
