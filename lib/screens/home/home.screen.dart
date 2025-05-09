import 'package:flutter/material.dart';
import 'package:gw_hub/api/home.api.dart';
import 'package:gw_hub/models/overview.model.dart';
import 'package:gw_hub/models/screen/home.model.dart';
import 'package:gw_hub/ui/colors.dart';
import 'package:gw_hub/ui/layouts/base_layout.layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HomeModel>(
        future: HomeApi.getOverview(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const BaseLayout(
                currentPage: 0,
                title: 'GW Hub',
                body: Center(child: LinearProgressIndicator()));
          }

          if (snapshot.error != null) {
            return const BaseLayout(
                currentPage: 0,
                title: 'GW Hub',
                body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ocorreu um erro, tente novamente mais tarde')
                    ]));
          }

          HomeModel homeData = snapshot.data!;

          return BaseLayout(
            currentPage: 0,
            title: 'GW Hub',
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Visão geral',
                        style: TextStyle(
                            fontSize: 24,
                            color: blackTypography,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                MediaQuery.of(context).orientation ==
                                        Orientation.portrait
                                    ? 2
                                    : 2 + 1,
                            crossAxisSpacing: 32,
                            mainAxisSpacing: 32,
                          ),
                          shrinkWrap: true,
                          itemCount: homeData.overview.length,
                          itemBuilder: (context, index) {
                            OverviewModel overview = homeData.overview[index];
                            return Container(
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: redPrimary.withOpacity(0.6),
                                      width: 2),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(),
                                    Text(
                                      overview.bigNumber,
                                      style: const TextStyle(
                                          color: blackSecondary,
                                          fontSize: 32,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      overview.description,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          color: blackSecondary,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ]),
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        'Dispositivos',
                        style: TextStyle(
                            fontSize: 24,
                            color: blackTypography,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: homeData.devices
                            .map((device) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 4),
                                  decoration: BoxDecoration(
                                      color: widgetBackground,
                                      border: Border(
                                          bottom: BorderSide(
                                              color: blackSecondary
                                                  .withOpacity(0.4),
                                              width: 1))),
                                  margin: const EdgeInsets.only(bottom: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          device.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: blackSecondary,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            device.active
                                                ? '(Ligado)'
                                                : '(Desligado)',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: blackSecondary,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Icon(
                                            device.active
                                                ? Icons.offline_bolt_outlined
                                                : Icons
                                                    .portable_wifi_off_outlined,
                                            color: blackSecondary,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
