import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/todo.dart';

 class TempleService {

  Future<List<TempleModel>> getAll() async {

  const url="https://jsonplaceholder.typicode.com/todos";
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if(response.statusCode == 200){

    final json = jsonDecode(response.body) as List;
    print('api response 12.----->---.xxxx $json');
    // iterate the data
    final todos = json.map((e) {
      return TempleModel(
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