import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../app/loader_helper.dart';
import 'baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'dynamicFieldRepo.dart';

class DynamicUiSurveryFormRepo
{
  List dynamicui_List = [];
  Future<List<DynamicField>> dynamicUi(SurveyCode) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sToken = prefs.getString('sToken');
    print('---19-  TOKEN---$sToken');
    print("------17-----$SurveyCode");

    try
    {
      showLoader();
      var baseURL = BaseRepo().baseurl;
      var endPoint = "BindSurveyParameters/BindSurveyParameters";
      var bindCityzenWardApi = "$baseURL$endPoint";
      var headers = {
        'token': '$sToken'
      };
      var request = http.Request('POST', Uri.parse('$bindCityzenWardApi'));

      request.body = json.encode({
        "iSurveyCode": SurveyCode,
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200)
      {
        hideLoader();
        var data = await response.stream.bytesToString();
        Map<String, dynamic> parsedJson = jsonDecode(data);
        final List fields = parsedJson['Data'];
        print("Dist list Marklocation Api ----71------>:$dynamicui_List");
        return fields.map((e) => DynamicField.fromJson(e)).toList();
      } else
      {
        hideLoader();
        return [];
      }
    } catch (e)
    {
      hideLoader();
      throw (e);
    }
  }
}
