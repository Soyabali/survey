import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../app/generalFunction.dart';
import '../app/loader_helper.dart';
import 'baseurl.dart';

class PostOccupancyCertificateReq {
  // this is a loginApi call functin
  GeneralFunction generalFunction = GeneralFunction();

  Future postOccupancyCertificate(
      BuildContext context,
      String random20digitNumber,
      iApplicationid,
      String remark, uplodeimageDocument_1, uplodeimageDocument_2, uplodeimageDocument_3, uplodeimageDocument_4,
      

      ) async {
    // sharedP
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('sToken');
    var sContactNo = prefs.getString('sContactNo');

    try {
      print('----iCerticateId---$random20digitNumber');
      print('----iApplicationid---$iApplicationid');
      print('----remark---$remark');
      print('----uplodeimageDocument_1---$uplodeimageDocument_1');
      print('----uplodeimageDocument_2---$uplodeimageDocument_2');
      print('----uplodeimageDocument_3---$uplodeimageDocument_3');
      print('----uplodeimageDocument_4---$uplodeimageDocument_4');

      var baseURL = BaseRepo().baseurl;

      /// TODO CHANGE HERE
      var endPoint = "PostOccupancyCertificateReq/PostOccupancyCertificateReq";
      var markPointSubmitApi = "$baseURL$endPoint";
      print('------------39---markPointSubmitApi---$markPointSubmitApi');

      String jsonResponse =
          '{"sArray":[{"iCerticateId":"$random20digitNumber","sApplicationId":$iApplicationid,"sApplicationRemarks":"$remark","sDocument1":"$uplodeimageDocument_1","sDocument2":"$uplodeimageDocument_2","sDocument3":"$uplodeimageDocument_3","sDocument4":"$uplodeimageDocument_4","sAppliedBy":"$sContactNo"}]}';
      //------------

      // Parse the JSON response
      Map<String, dynamic> parsedResponse = jsonDecode(jsonResponse);

// Get the array value
      List<dynamic> sArray = parsedResponse['sArray'];

// Convert the array to a string representation
      String sArrayAsString = jsonEncode(sArray);

// Update the response object with the string representation of the array
      parsedResponse['sArray'] = sArrayAsString;

// Convert the updated response object back to JSON string
      String updatedJsonResponse = jsonEncode(parsedResponse);

// Print the updated JSON response (optional)
      print(updatedJsonResponse);
      print('---70-----$updatedJsonResponse');

//Your API call
      var headers = {'token': '$token', 'Content-Type': 'application/json'};

      var request = http.Request(
          'POST',
          Uri.parse(
              'http://115.244.7.153/diucitizenapi/api/PostOccupancyCertificateReq/PostOccupancyCertificateReq'));
      request.body = updatedJsonResponse; // Assign the JSON string to the request body
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var map;
      var data = await response.stream.bytesToString();
      map = json.decode(data);
      print('-------89--$map');
      print('---90---${response.statusCode}');
      // var response;
      // var map;
      //print('----------20---LOGINaPI RESPONSE----$map');
      if (response.statusCode == 200) {
        print('------92----xxxxxxxxxxxxxxx----');
        hideLoader();
        print('----------96-----$map');
        return map;
      } else if(response.statusCode==401)
      {
        generalFunction.logout(context);
      }else{
        print('----------99----$map');
        hideLoader();
        print(response.reasonPhrase);
        return map;
      }
    } catch (e) {
      hideLoader();
      debugPrint("exception: $e");
      throw e;
    }
  }
}
