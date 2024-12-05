import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/loader_helper.dart';
import 'baseurl.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class AdvertisementPlanRepo
{
  List advertisementPlanList = [];
  void displayToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  Future<List> advertisementPlan(dropDownValueAdvertisementPlaceValue) async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sToken = prefs.getString('sToken');
    //print('---19-  TOKEN---$sToken');
    print("----------17------$dropDownValueAdvertisementPlaceValue");

    try
    {
      showLoader();
      var baseURL = BaseRepo().baseurl;
      var endPoint = "GetAdPlan/GetAdPlan";
      var advertisementPlanApi = "$baseURL$endPoint";
      var headers = {
        'token': '$sToken'
      };
      var request = http.Request('POST', Uri.parse('$advertisementPlanApi'));

      request.body = json.encode({
        "iAdSpaceCode": dropDownValueAdvertisementPlaceValue
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200)
      {
        hideLoader();
        var data = await response.stream.bytesToString();
        Map<String, dynamic> parsedJson = jsonDecode(data);

        if (parsedJson['Data'] != null && parsedJson['Data'] is List) {
          advertisementPlanList = parsedJson['Data'];
        } else {
          advertisementPlanList = []; // Assign an empty list
          displayToast("No data available for this ID."); // Show a toast
        }

       // print("Dist advertisementPlanList Api ----71------>:$advertisementPlanList");
        return advertisementPlanList;
      } else
      {
        hideLoader();
        return advertisementPlanList;
      }
    } catch (e)
    {
      hideLoader();
      throw (e);
    }
  }
}
