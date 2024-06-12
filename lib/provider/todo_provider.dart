import 'package:flutter/foundation.dart';
import 'package:rest_api_provider/services/todo_services.dart';

import '../model/todo.dart';
// this is a provider class
class TodoProvider extends ChangeNotifier {
  // create  a instance of service class
  final _service = TodoService();
  bool isLoading=false;
  List<Todo> _todos=[];
  List<Todo> get todos => _todos;
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