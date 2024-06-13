import 'package:flutter/foundation.dart';

import '../model/todo.dart';
import '../services/todo_services.dart';
// this is a provider class
class TempleProvider extends ChangeNotifier {
  // create  a instance of service class
  final _service = TempleService();
  bool isLoading=false;
  List<TempleModel> _todos=[];
  List<TempleModel> get todos => _todos;
  // bind provider to service
  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();
    _todos=response;
    isLoading = false;
    print('Provide api response 18...xxx $_todos');
    notifyListeners();
  }
}