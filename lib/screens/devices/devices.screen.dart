import 'package:flutter/material.dart';
import 'package:gw_hub/api/devices.api.dart';
import 'package:gw_hub/models/screen/devices.model.dart';
import 'package:gw_hub/ui/colors.dart';

class DevicesScreen extends StatefulWidget {
  const DevicesScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DevicesScreenState();
}

class _DevicesScreenState extends State<DevicesScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DevicesModel>(
        future: DevicesApi.getDevicesList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: LinearProgressIndicator());
          }

          if (snapshot.error != null) {
            return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ocorreu um erro, tente novamente mais tarde')
                ]);
          }

          DevicesModel devicesData = snapshot.data!;

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dispositivos',
                          style: TextStyle(
                              fontSize: 24,
                              color: blackTypography,
                              fontWeight: FontWeight.w300),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.add,
                            size: 32,
                            color: redPrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      children: devicesData.devices
                          .map((device) => Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 4),
                                decoration: BoxDecoration(
                                    color: widgetBackground,
                                    border: Border(
                                        bottom: BorderSide(
                                            color:
                                                blackSecondary.withOpacity(0.4),
                                            width: 1))),
                                margin: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            device.name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: blackSecondary,
                                                fontSize: 18),
                                          ),
                                          Text(
                                            device.id,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                color: blackSecondary,
                                                fontSize: 12),
                                          ),
                                        ],
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
                                              fontSize: 14),
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
                                          size: 28,
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
          );
        });
  }
}
