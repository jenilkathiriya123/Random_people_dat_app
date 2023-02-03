import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Helper/rendom_data.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<Rendomdata?> fetchRendomData() async {
    String api = "https://randomuser.me/api/";



    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);

      print("ok");

      Rendomdata weather = Rendomdata.fromMap(data: decodedData);

      return weather;
    } else if (res.statusCode == 404) {
      print("Error");
    }
    // return null;
  }
}
