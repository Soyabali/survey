import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../app/generalFunction.dart';
import '../app/loader_helper.dart';
import 'baseurl.dart';

class PostCitizenComplaintRepo {
  // this is a loginApi call functin
  GeneralFunction generalFunction = GeneralFunction();

  Future postComplaint(
      BuildContext context, String random12digitNumber, categoryType, selectedWardId, String location, double? lat, double? long, String complaintDescription, uplodedImage, String formattedDate, String iPostedBy, String iAgencyCode, String? sContactNo, iCategoryCodeList, File? image) async {
    // sharedP
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('sToken');
    var iPostedBy2 = prefs.getString('sContactNo');

    //  ---
    // firstFormCombinedList.add({
    //   "iCompCode": random12DigitNumber,
    //   "iPointTypeCode": categoryType,
    //   "iSectorCode": _selectedWardId,
    //   "sLocation": location,
    //   "fLatitude": lat,
    //   "fLongitude": long,
    //   "sDescription": complaintDescription,
    //   "sBeforePhoto": uplodedImage,
    //   "dPostedOn": formattedDate,
    //   "iPostedBy": 0,
    //   "iAgencyCode": 1,
    //   "sCitizenContactNo": sContactNo
    // });
    //--

    try {
      showLoader();
      print('----iCompCode----40---$random12digitNumber');
      print('----iPointTypeCode----41---$categoryType');
      print('----iSectorCode---43--$selectedWardId');
      print('----sWardCode---44--$location');
      print('----sLocation---45--$complaintDescription');
      print('----sComplaintPhoto---46--$uplodedImage');
      print('----sContactNo---47--$sContactNo');// lat
      print('----lat---48--$lat');
      print('----long---49--$long');
      print('----long---50--$long');
      print('----iPostedBy---51--$iPostedBy');
      print('----iAgencyCode---52--$iAgencyCode');
      print('----iAgencyCode-----53---$iAgencyCode');
     //  iCategoryCodeList
      print('----iCategoryCodeList-----54---$iCategoryCodeList');
      print("--------55--token--$token");

      var baseURL = BaseRepo().baseurl;

      /// TODO CHANGE HERE
      var endPoint = "PostCitizenComplaint/PostCitizenComplaint";
      var postComplaintApi = "$baseURL$endPoint";
      print('------------48-----postComplaintApi---$postComplaintApi');
     //  random12digitNumber  -  lat -- long -- uplodedImage ---categoryType
      String jsonResponse = '{"sArray":[{"iCompCode":"$random12digitNumber","iPointTypeCode":"$iCategoryCodeList","iSectorCode":"$selectedWardId","sLocation":"$location","fLatitude":"$lat","fLongitude":"$long","sDescription":"$complaintDescription","sBeforePhoto":"$uplodedImage","dPostedOn":"$formattedDate","iPostedBy":"$iPostedBy","iAgencyCode":"$iAgencyCode","sCitizenContactNo":"$sContactNo"}]}';
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

      var request = http.Request('POST',Uri.parse('$postComplaintApi'));
      request.body =
          updatedJsonResponse; // Assign the JSON string to the request body
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