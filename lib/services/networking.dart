import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Networking(this.url);
  Uri url = Uri();

  Future getData() async {
    http.Response response = await http.get(url);
    String weather = response.body;
    return jsonDecode(weather);
  }
}
