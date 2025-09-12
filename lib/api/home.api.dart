import 'package:gw_hub/api/devices.api.dart';
import 'package:gw_hub/models/device.model.dart';
import 'package:gw_hub/models/overview.model.dart';
import 'package:gw_hub/models/screen/home.model.dart';

class HomeApi {
  static Future<HomeModel> getOverview() async {
    List<DeviceModel> devices = (await DevicesApi.getDevicesList()).devices;
    List<OverviewModel> overview = [
      OverviewModel(bigNumber: '86%', description: 'de energia restante'),
      OverviewModel(
          bigNumber: devices.length.toString(),
          description: 'Nº de dispositivos '),
      OverviewModel(bigNumber: '1234', description: 'kW de energia consumida'),
    ];

    return HomeModel(overview: overview, devices: devices);
  }
}
