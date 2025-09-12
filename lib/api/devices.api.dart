import 'dart:convert' as convert;

import 'package:gw_hub/api/settings.dart';
import 'package:gw_hub/models/device.model.dart';
import 'package:gw_hub/models/screen/devices.model.dart';
import 'package:http/http.dart' as http;

class DevicesApi {
  static Future<DevicesModel> getDevicesList() async {
    try {
      var url = Uri.parse(baseUrl + devicesEndpoint);

      Map<String, String> requestHeader = {
        ...headers,
        'Authorization': apiToken
      };
      var response = await http.get(url, headers: requestHeader);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse =
            convert.jsonDecode(response.body) as List<dynamic>;
        List<DeviceModel> devices = [];
        for (int i = 0; i < jsonResponse.length; i++) {
          devices.add(DeviceModel(
              name: jsonResponse[i]['name'],
              active: jsonResponse[i]['isActive'],
              id: jsonResponse[i]['id']));
        }
        return DevicesModel(devices: devices);
      } else {
        return DevicesModel(devices: []);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<DevicesModel> createDevice(String name) async {
    try {
      var url = Uri.parse(baseUrl + devicesEndpoint);

      Map<String, String> requestHeader = {
        ...headers,
        'Authorization': apiToken
      };
      var response = await http.post(url, headers: requestHeader);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse =
            convert.jsonDecode(response.body) as List<dynamic>;
        List<DeviceModel> devices = [];
        for (int i = 0; i < jsonResponse.length; i++) {
          devices.add(DeviceModel(
              name: jsonResponse[i]['name'],
              active: jsonResponse[i]['isActive'],
              id: jsonResponse[i]['id']));
        }
        return DevicesModel(devices: devices);
      } else {
        return DevicesModel(devices: []);
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<void> toggleDeviceStatus(DeviceModel device) async {
    try {
      var url = Uri.parse("$baseUrl$devicesEndpoint/${device.id}");

      Map<String, String> requestHeader = {
        ...headers,
        'Authorization': apiToken
      };
      var response = await http.put(
        url,
        body: convert.JsonCodec().encode({
          'isActive': device.active ? 0 : 1,
          'name': device.name,
          'description': 'Dispositivo'
        }),
        headers: requestHeader,
      );
      if (response.statusCode == 200) {}
    } catch (e) {
      rethrow;
    }
  }
}
