import 'dart:convert' as convert;
import 'package:gw_hub/api/settings.dart';
import 'package:gw_hub/models/message.model.dart';
import 'package:http/http.dart' as http;

class ChatApi {
  static Future<MessageModel> getChatMessages(String message) async {
    try {
      var url = Uri.parse(baseUrl + sendMessageEndpoint);

      Map<String, String> requestHeader = {
        ...headers,
        'Authorization': apiToken
      };
      var response =
          await http.post(url, body:  convert.JsonEncoder().convert({"fala": message}), headers: requestHeader);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        return MessageModel(text: jsonResponse['data'], sentByMe: false);
      } else {
        return MessageModel(
            text: 'Não consigo responder isso, tente novamente mais tarde',
            sentByMe: false);
      }
    } catch (e) {
      return MessageModel(
          text: 'Não consigo responder isso, tente novamente mais tarde',
          sentByMe: false);
    }
  }
}
