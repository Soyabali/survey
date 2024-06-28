
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DistRepo
{
  List distList = [];
  Future<List> getDistList() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sToken = prefs.getString('sToken');
    String? iUserId = prefs.getString('iUserId');

    try
    {
      var headers = {
        'token': '$sToken',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('https://upegov.in/noidaoneapi/Api/BindSector/BindSector'));
      request.body = json.encode({
        "iUserId": "$iUserId"
      });
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200)
      {
        var data = await response.stream.bytesToString();
        Map<String, dynamic> parsedJson = jsonDecode(data);
        distList = parsedJson['Data'];
        print("Dist list xxxxxxxxx 61----61------>:$distList");
        return distList;
      } else
      {
        return distList;
      }
    } catch (e)
    {
      throw (e);
    }
  }
}