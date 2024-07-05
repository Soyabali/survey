
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../app/generalFunction.dart';
import '../app/loader_helper.dart';
import '../model/templelistModel.dart';
import 'baseurl.dart';

class TempleListRepo {
  GeneralFunction generalFunction = GeneralFunction();

  Future<List<TempleListModel>?> getTempleList(BuildContext context, double lat, double long) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? sToken = prefs.getString('sToken');

    try {
      var baseURL = BaseRepo().baseurl;
      var endPoint = "GetTempleList/GetTempleList";
      var emeggencyContactTitleApi = "$baseURL$endPoint";
      showLoader();

      var headers = {
        'token': '$sToken',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse('$emeggencyContactTitleApi'));

      request.body = json.encode({
        "fLatitude": lat,
        "fLongitude": long,
      });

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        hideLoader();
        var data = await response.stream.bytesToString();
        Map<String, dynamic> parsedJson = jsonDecode(data);
        List<dynamic>? dataList = parsedJson['Data'];

        if (dataList != null) {
          // response convert into the model
          List<TempleListModel> temples = dataList.map((json) => TempleListModel.fromJson(json)).toList();
          print('-----47----$temples');
          return temples;
        } else {
          return null;
        }
      } else {
        hideLoader();
        return null;
      }
    } catch (e) {
      hideLoader();
      debugPrint("Exception: $e");
      throw e;
    }
  }
}


// class TempleListRepo {
//
//   GeneralFunction generalFunction = GeneralFunction();
//   Future<List<Map<String, dynamic>>?> getTempleList(BuildContext context, lat,long) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? sToken = prefs.getString('sToken');
//     String? iCitizenCode = prefs.getString('iCitizenCode');
//
//     print('-----16---$sToken');
//     print('-----17---$iCitizenCode');
//     print('---token----$sToken');
//     print('--lat---21--$lat');
//     print('--long---21--$long');
//     // print('---iHeadCode----$iHeadCode');
//
//     try {
//       var baseURL = BaseRepo().baseurl;
//       var endPoint = "GetTempleList/GetTempleList";
//       var emeggencyContactTitleApi = "$baseURL$endPoint";
//       showLoader();
//
//       var headers = {
//         'token': '$sToken',
//         'Content-Type': 'application/json'
//       };
//       var request = http.Request('POST', Uri.parse('$emeggencyContactTitleApi'));
//
//       request.body = json.encode({
//         "fLatitude": lat,
//         "fLongitude": long,
//       });
//
//       request.headers.addAll(headers);
//       http.StreamedResponse response = await request.send();
//       // if(response.statusCode ==401){
//       //   generalFunction.logout(context);
//       // }
//       if (response.statusCode == 200) {
//         hideLoader();
//         var data = await response.stream.bytesToString();
//         Map<String, dynamic> parsedJson = jsonDecode(data);
//         List<dynamic>? dataList = parsedJson['Data'];
//
//         if (dataList != null) {
//           List<Map<String, dynamic>> notificationList = dataList.cast<Map<String, dynamic>>();
//           print("xxxxx------46----: $notificationList");
//           return notificationList;
//         } else{
//           return null;
//         }
//       } else {
//         hideLoader();
//         return null;
//       }
//     } catch (e) {
//       hideLoader();
//       debugPrint("Exception: $e");
//       throw e;
//     }
//   }
// }
