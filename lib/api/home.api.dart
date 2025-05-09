import 'package:gw_hub/models/device.model.dart';
import 'package:gw_hub/models/overview.model.dart';
import 'package:gw_hub/models/screen/home.model.dart';

class HomeApi {
  static Future<HomeModel> getOverview() async {
    await Future.delayed(const Duration(milliseconds: 400));
    List<OverviewModel> overview = const [
      OverviewModel(bigNumber: '86%', description: 'de energia restante'),
      OverviewModel(bigNumber: '3', description: 'Nº de dispositivos '),
      OverviewModel(bigNumber: '1234', description: 'kW de energia consumida'),
    ];
    List<DeviceModel> devices = const [
      DeviceModel(name: 'Inversor', active: true, id: 'ajdcac-12dn'),
      DeviceModel(name: 'Bateria', active: false, id: 'cas-23'),
      DeviceModel(name: 'Conversor', active: true, id: 'ajdsdcac-0023'),
    ];

    return HomeModel(overview: overview, devices: devices);
  }
}
