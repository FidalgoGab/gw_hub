import 'package:gw_hub/models/device.model.dart';
import 'package:gw_hub/models/overview.model.dart';

class HomeModel {
  final List<OverviewModel> overview;
  final List<DeviceModel> devices;

  const HomeModel({required this.overview, required this.devices});
}
