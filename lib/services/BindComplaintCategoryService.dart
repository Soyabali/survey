import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../model/BindComplaintCategoryModel.dart';
import 'baseurl.dart';


class BindComplaintCategoryService {

  Future<List<BindComplaintCategoryModel>> getbindComplaint() async {
    // get a localData

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var  sToken = prefs.getString('sToken');
    print('---sToken-----15----$sToken');

    var baseURL = BaseRepo().baseurl;
    var endPoint = "BindComplaintCategory/BindComplaintCategory";
    var bindComplaintApi = "$baseURL$endPoint";
    var token = '$sToken'; // Replace this with the actual token retrieval logic

    print('------------17---bindComplaintApi---$bindComplaintApi');

    final uri = Uri.parse(bindComplaintApi);

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token', // Add your token here
        'Content-Type': 'application/json',
      },
    );

    if(response.statusCode == 200){
      // Decode the response
      final jsonResponse = jsonDecode(response.body);
      print('api response 18.----->---.xxxx $jsonResponse');

      if (jsonResponse['Result'] == '1') {
        final List<dynamic> data = jsonResponse['Data'];
        final todos = data.map((e) {
          return BindComplaintCategoryModel(
            iCategoryCode: e['iCategoryCode'],
            sCategoryName: e['sCategoryName'],
          );
        }).toList();
        return todos;
      } else {
        // Handle case where "Result" is not "1"
        print('Error: ${jsonResponse['Msg']}');
        return [];
      }
    } else {
      // Handle non-200 response status
      print('Failed to load data. Status code: ${response.statusCode}');
      return [];
    }
  }
}


// class BindComplaintCategoryService {
//
//   Future<List<BindComplaintCategoryModel>> getbindComplaint() async {
//     var baseURL = BaseRepo().baseurl;
//     var endPoint = "BindComplaintCategory/BindComplaintCategory";
//     var bindComplaintApi = "$baseURL$endPoint";
//
//     print('------------17---bindComplaintApi---$bindComplaintApi');
//
//     final uri = Uri.parse(bindComplaintApi);
//
//     final response = await http.get(uri);
//
//     if(response.statusCode == 200){
//       // todo decode the response
//       final jsonResponse = jsonDecode(response.body);
//       print('api response 18.----->---.xxxx $jsonResponse');
//
//       if (jsonResponse['Result'] == '1') {
//         final List<dynamic> data = jsonResponse['Data'];
//         final todos = data.map((e) {
//           return BindComplaintCategoryModel(
//             iCategoryCode: e['iCategoryCode'],
//             sCategoryName: e['sCategoryName'],
//           );
//         }).toList();
//         return todos;
//       } else {
//         // Handle case where "Result" is not "1"
//         print('Error: ${jsonResponse['Msg']}');
//         return [];
//       }
//     } else {
//       // Handle non-200 response status
//       print('Failed to load data. Status code: ${response.statusCode}');
//       return [];
//     }
//   }
// }