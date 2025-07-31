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

      var headers = {'token': '$token', 'Content-Type': 'application/json'};

      var request = http.Request('POST', Uri.parse(url));
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
        generalFunction.logout(context);
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


//   Future dynamicServe(
//       BuildContext context,
//       String allThreeFormJson,
//       ) async {
//     // sharedP
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var token = prefs.getString('sToken');
//
//     try {
//       print('----allThreeFormJson---->>>---24----$allThreeFormJson');
//
//       var baseURL = BaseRepo().baseurl;
//
//       /// TODO CHANGE HERE
//       var endPoint = "BindSurveyParameters/BindSurveyParameters";
//       var markPointSubmitApi = "$baseURL$endPoint";
//
//       print('------------39---markPointSubmitApi---$markPointSubmitApi');
//
//       // String jsonResponse = '{"sArray":$allThreeFormJson"}';
//       String jsonResponse = '{"Responses":$allThreeFormJson}';
//       // String jsonResponse = 'sArray":$allThreeFormJson';
//       // String jsonResponse = '{"sArray":"$allThreeFormJson"}';
//
//       print("------41---> $jsonResponse");
//       //------------
//       // Parse the JSON response
//       Map<String, dynamic> parsedResponse = jsonDecode(jsonResponse);
//
// // Get the array value
//       List<dynamic> sArray = parsedResponse['Responses'];
//
// // Convert the array to a string representation
//       String sArrayAsString = jsonEncode(sArray);
//
// // Update the response object with the string representation of the array
//       parsedResponse['Responses'] = sArrayAsString;
//
// // Convert the updated response object back to JSON string
//       String updatedJsonResponse = jsonEncode(parsedResponse);
//
// // Print the updated JSON response (optional)
//       print(updatedJsonResponse);
//       print('---70-----$updatedJsonResponse');
//
// //Your API call
//       var headers = {'token': '$token', 'Content-Type': 'application/json'};
//
//       var request = http.Request(
//           'POST',
//           Uri.parse('https://upegov.in/DynamicSurveyApis/Api/BindSurveyParameters/BindSurveyParameters'));
//       request.body =
//           updatedJsonResponse; // Assign the JSON string to the request body
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();
//
//       var map;
//       var data = await response.stream.bytesToString();
//       map = json.decode(data);
//       print('-------89--$map');
//       print('---90---${response.statusCode}');
//       // var response;
//       // var map;
//       //print('----------20---LOGINaPI RESPONSE----$map');
//       if (response.statusCode == 200) {
//         print('------92----xxxxxxxxxxxxxxx----');
//         hideLoader();
//         print('----------96-----$map');
//         return map;
//       } else if(response.statusCode==401)
//       {
//         generalFunction.logout(context);
//       }else{
//         print('----------99----$map');
//         hideLoader();
//         print(response.reasonPhrase);
//         return map;
//       }
//     } catch (e) {
//       hideLoader();
//       debugPrint("exception: $e");
//       throw e;
//     }
//   }
}
