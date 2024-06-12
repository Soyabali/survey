import 'dart:convert';

import 'package:rest_api_provider/model/todo.dart';
import 'package:http/http.dart' as http;

 class TodoService {
  Future<List<Todo>> getAll() async {
  const url="https://jsonplaceholder.typicode.com/todos";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if(response.statusCode == 200){
    final json = jsonDecode(response.body) as List;
    print('api response 12.----->---.xxxx $json');
    // iterate the data
    final todos = json.map((e) {
      return Todo(
          id: e['id'],
          userId: e['userId'],
          title: e['title'],
          completed: e['completed'],
      );
    }).toList();
    return todos;
  }
  return [];
  }
}