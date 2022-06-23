import 'dart:convert';
import 'package:chatt_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class ApiService {
  Client client = Client();

  Future<dynamic> getEmotion(message) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.predictEndpoint);
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', url);
    request.body = json.encode({
      "message": message
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String asd = await response.stream.bytesToString();
      return json.decode(asd)["emotion"];
    }
    else {
      print(response.reasonPhrase);
    }
    return null;
  }

  Future<dynamic> getPercentage(message) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.percentageEndpoint);

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', url);
    request.body = json.encode({
      "message": message
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String asd = await response.stream.bytesToString();
      return json.decode(asd)["emotion"];
    }
    else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
