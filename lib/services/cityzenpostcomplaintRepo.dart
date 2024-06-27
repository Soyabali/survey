import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../app/generalFunction.dart';
import '../app/loader_helper.dart';
import 'baseurl.dart';

class MarkPointSubmitRepo {
  GeneralFunction generalFunction = GeneralFunction();

  // randomNumber,
  // category,
  // _dropDownValueComplaintSubCategory,
  // _dropDownValueWard,
  // address,
  // landmark,
  // mention,
  // image,

  Future markpointsubmit(
      BuildContext context,
      randomNumber,
      category,
      _dropDownValueComplaintSubCategory,
      _dropDownValueWard,
      address,
      landmark,
      mention,
      image) async {
    // sharedP
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('sToken');
      print('---token ---$token');
    try {
      var baseURL = BaseRepo().baseurl;
      /// TODO CHANGE HERE
      var endPoint = "CitizenPostComplaint/CitizenPostComplaint";
      var markPointSubmitApi = "$baseURL$endPoint";



      //====
    //   "iCompCode": "2024062718335251257",
    // "iSubCategoryCode": "4",
    // "sWardCode": "5",
    // "sAddress": "Ten Tower ",
    // "sLandmark": "Testing ",
    // "sComplaintDetails": "Mention your concern ",
    // "sComplaintPhoto": "http:\/\/49.50.66.156\/PuriOneCitizenApi\/UploadedPhotos\/CompImage\/270620241829192297.png",
    // "sPostedBy": "8755553370",
    // "fLatitude": "28.6064095",
    // "fLongitude": "77.3695671"

    //-------

      String jsonResponse =
          '{"sArray":[{"iCompCode":$randomNumber,"iSubCategoryCode":"NA","sWardCode":$_dropDownValueWard,"sAddress":"$address","sLandmark":$landmark,"sComplaintDetails":$mention,"sComplaintPhoto":"NA","sPostedBy":"9871950881","fLatitude":"72.8765","fLongitude":"70.9898"}]}';
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
      print('---63-----$updatedJsonResponse');

//Your API call
      var headers = {'token': '$token', 'Content-Type': 'application/json'};

      var request = http.Request(
          'POST',
          Uri.parse(
              'https://upegov.in/purionecitizenapi/api/CitizenPostComplaint/CitizenPostComplaint'));
      request.body =
          updatedJsonResponse; // Assign the JSON string to the request body
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      var map;
      var data = await response.stream.bytesToString();
      map = json.decode(data);
      print('---90---${response.statusCode}');
      if (response.statusCode == 200) {
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

// class CityzenPostComplaintRepo {
//   GeneralFunction generalFunction = GeneralFunction();
//
//   Future cityzenPostComplaint(
//       BuildContext context,
//       random,
//       category,
//       _dropDownValueComplaintSubCategory,
//       _dropDownValueWard,
//       address,
//       landmark,
//       mention,
//       image
//       ) async {
//     // sharedP
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var token = prefs.getString('sToken');
//     try {
//       var baseURL = BaseRepo().baseurl;
//       /// TODO CHANGE HERE
//       var endPoint = "CitizenPostComplaint/CitizenPostComplaint";
//       var markPointSubmitApi = "$baseURL$endPoint";
//
//     //   "iCompCode": "2024062718335251257",
//     // "iSubCategoryCode": "4",
//     // "sWardCode": "5",
//     // "sAddress": "Ten Tower ",
//     //
//     // "sLandmark": "Testing ",
//     // "sComplaintDetails": "Mention your concern ",
//     // "sComplaintPhoto": "http:\/\/49.50.66.156\/PuriOneCitizenApi\/UploadedPhotos\/CompImage\/270620241829192297.png",
//     // "sPostedBy": "8755553370",
//     // "fLatitude": "28.6064095",
//     // "fLongitude": "77.3695671"
//
//       print('---iCompCode--$random');
//       print('---iSubCategoryCode--$category');
//       print('---sWardCode--$_dropDownValueWard');
//       print('---sAddress--$address');
//       print('---sLandmark--$landmark');
//       print('---sComplaintDetails--$mention');
//       print('---sComplaintPhoto--$image');
//       print('---sPostedBy--"9871950881"');
//       print('---fLatitude--"72.43443"');
//       print('---fLongitude--"70.545454"');
//
//     //   "iCompCode": "2024062718335251257",
//     // "iSubCategoryCode": "4",
//     // "sWardCode": "5",
//     // "sAddress": "Ten Tower ",
//     // "sLandmark": "Testing ",
//     // "sComplaintDetails": "Mention your concern ",
//     // "sComplaintPhoto": "http:\/\/49.50.66.156\/PuriOneCitizenApi\/UploadedPhotos\/CompImage\/270620241829192297.png",
//     // "sPostedBy": "8755553370",
//     // "fLatitude": "28.6064095",
//   //  "fLongitude": "77.3695671"
//
//
//       // String jsonResponse =
//       //     '{"sArray":[{"iCompCode":$random,"iSubCategoryCode":$_dropDownValueComplaintSubCategory,"sWardCode":$_dropDownValueWard,"sAddress":"$address","sLandmark":$landmark,"sComplaintDetails":"Mention Your Concern","sComplaintPhoto":"$image","sPostedBy":"9871950881","fLatitude":"72.70999","fLongitude":"70.876543"}]}';
//
//
//       String jsonResponse =
//           '{"sArray":[{"iCompCode":"87654524","iSubCategoryCode":$_dropDownValueComplaintSubCategory,"sWardCode":$_dropDownValueWard,"sAddress":"$address","sLandmark":$landmark,"sComplaintDetails":"Mention Your Concern","sComplaintPhoto":"NA","sPostedBy":"9871950881","fLatitude":"72.70999","fLongitude":"70.876543"}]}';
//
//       // Parse the JSON response
//       Map<String, dynamic> parsedResponse = jsonDecode(jsonResponse);
//
// // Get the array value
//       List<dynamic> sArray = parsedResponse['sArray'];
//
// // Convert the array to a string representation
//       String sArrayAsString = jsonEncode(sArray);
//
// // Update the response object with the string representation of the array
//       parsedResponse['sArray'] = sArrayAsString;
//
// // Convert the updated response object back to JSON string
//       String updatedJsonResponse = jsonEncode(parsedResponse);
//
// // Print the updated JSON response (optional)
//       print(updatedJsonResponse);
//       print('---63-----$updatedJsonResponse');
//
// //Your API call
//       var headers = {'token': '$token', 'Content-Type': 'application/json'};
//
//       var request = http.Request(
//           'POST',
//           Uri.parse(
//               'https://upegov.in/purionecitizenapi/api/CitizenPostComplaint/CitizenPostComplaint'));
//       request.body =
//           updatedJsonResponse; // Assign the JSON string to the request body
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();
//
//       var map;
//       var data = await response.stream.bytesToString();
//       map = json.decode(data);
//       print('---90---${response.statusCode}');
//       if (response.statusCode == 200) {
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
// }