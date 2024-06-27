import 'package:flutter/foundation.dart';

import '../model/BindComplaintCategoryModel.dart';
import '../model/todo.dart';
import '../services/BindComplaintCategoryService.dart';
import '../services/todo_services.dart';
// this is a provider class
// class BindComplaintProvider extends ChangeNotifier {
//   // create  a instance of service class
//   final _service = BindComplaintCategoryService();
//   bool isLoading=false;
//   // take a empty model that have a list.
//   List<BindComplaintCategoryModel> _todos=[];
//   // get the response data here todos is a variable that store the api response.
//   List<BindComplaintCategoryModel> get todos => _todos;
//   // bind provider to service
//   Future<void> getComplaint() async {
//     isLoading = true;
//     notifyListeners();
//     final response = await _service.getbindComplaint();
//     _todos=response;
//     isLoading = false;
//     print('Provide api response 23...xxx $_todos');
//     notifyListeners();
//   }
// }

class BindComplaintProvider extends ChangeNotifier {
  final _service = BindComplaintCategoryService();
  bool isLoading = false;
  List<BindComplaintCategoryModel> _todos = [];

  List<BindComplaintCategoryModel> get todos => _todos;

  Future<void> getComplaint() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getbindComplaint();
    _todos = response;
    isLoading = false;
    print('Provide api response 23...xxx $_todos');
    notifyListeners();
  }
}