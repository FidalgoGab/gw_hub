import 'package:flutter/material.dart';
import 'package:gw_hub/screens/chat/chat.screen.dart';
import 'package:gw_hub/screens/devices/devices.screen.dart';
import 'package:gw_hub/screens/home/home.screen.dart';
import 'package:gw_hub/screens/profile/profile.screen.dart';
import 'package:gw_hub/ui/colors.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('GW Hub'),
            InkWell(
              onTap: () {
                setState(() {
                  _tabController.index = 3;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    border: Border.all(color: whiteTypography)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                  child: Image.network(
                    'https://s2-oglobo.glbimg.com/RxvRKNHvx9PhitTDbg8mkXp5P_E=/107x0:661x400/888x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2025/Q/U/UwAyNcR6AUDNDuoaVodg/divulgacao.png',
                    width: 45,
                    height: 45,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          HomeScreen(),
          HomeScreen(),
          DevicesScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(width: 1, color: redPrimary))),
        child: TabBar(
          onTap: (value) {
            if (value == 1) {
              _tabController.index = 0;
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChatScreen()));
            } else {
              setState(() {
                _tabController.index = value;
              });
            }
          },
          controller: _tabController,
          indicatorColor: redPrimary,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: const EdgeInsets.all(0),
          tabs: [
            Tab(
              icon: Icon(
                _tabController.index == 0
                    ? Icons.window
                    : Icons.window_outlined,
                color: redPrimary,
                size: _tabController.index == 0 ? 32 : 28,
              ),
            ),
            Tab(
              icon: Icon(
                _tabController.index == 1
                    ? Icons.message
                    : Icons.message_outlined,
                color: redPrimary,
                size: _tabController.index == 1 ? 32 : 28,
              ),
            ),
            Tab(
              icon: Icon(
                _tabController.index == 2
                    ? Icons.tungsten
                    : Icons.tungsten_outlined,
                color: redPrimary,
                size: _tabController.index == 2 ? 32 : 28,
              ),
            ),
            Tab(
              icon: Icon(
                _tabController.index == 3
                    ? Icons.person_2
                    : Icons.person_2_outlined,
                color: redPrimary,
                size: _tabController.index == 3 ? 32 : 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
