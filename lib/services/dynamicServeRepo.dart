import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../app/generalFunction.dart';
import '../app/loader_helper.dart';
import 'baseurl.dart';

class DynamicServerRepo {

  // this is a loginApi call functin

  GeneralFunction generalFunction = GeneralFunction();

  Future<dynamic> dynamicServe(BuildContext context, String allThreeFormJson) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('sToken');

    try {
      var baseURL = BaseRepo().baseurl;
      var endPoint = "SaveSurvey/SaveSurvey";
      var url = "$baseURL$endPoint";
      print("---26----: $allThreeFormJson");
      var headers = {'token': '$token',
        'Content-Type': 'application/json'};

      var request = http.Request('POST', Uri.parse(url));
      // here you put your json into the body
      request.body = allThreeFormJson;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var data = await response.stream.bytesToString();
      var map = json.decode(data);
      print("Response: $map");

      if (response.statusCode == 200) {
        hideLoader();
        return map;
      } else if (response.statusCode == 401) {
        // logout function
       // generalFunction.logout(context);
      } else {
        hideLoader();
        return map;
      }
    } catch (e) {
      hideLoader();
      debugPrint("Exception: $e");
      throw e;
    }
  }
}
