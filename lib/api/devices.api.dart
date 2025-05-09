import 'package:gw_hub/models/device.model.dart';
import 'package:gw_hub/models/screen/devices.model.dart';

class DevicesApi {
  static Future<DevicesModel> getDevicesList() async {
    await Future.delayed(const Duration(milliseconds: 600));

    List<DeviceModel> devices = const [
      DeviceModel(name: 'Inversor', active: true, id: 'ajdcac-12dn'),
      DeviceModel(name: 'Bateria', active: false, id: 'cas-23'),
      DeviceModel(name: 'Conversor', active: true, id: 'ajdsdcac-0023'),
    ];

    return DevicesModel(devices: devices);
  }
}
