import 'package:http/http.dart' as http;
import 'dart:convert';

class Get {
  String id;
  String nama;
  String email;

  Get({this.id, this.nama, this.email});

  factory Get.createGet(Map<String, dynamic> object) {
    return Get(
        id: object["id"].toString(),
        nama: object["first_name"] + " " + object["last_name"],
        email: object["email"]);
  }

  static Future<Get> connectApi(String id) async {
    String url = "https://reqres.in/api/users/" + id;
    var apiResult = await http.get(url);
    var jsonObject = json.decode(apiResult.body);

    var userData = (jsonObject as Map<String, dynamic>)['data'];

    return Get.createGet(userData);
  }
}
