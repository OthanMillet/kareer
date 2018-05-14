import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:my_app/data/restful_data.dart';

String url = 'https://my-json-server.typicode.com/OthanMillet/fakerserver/users/';
Future<Post> fetchPost(email) async {
  var user = 2;
  // var password = 'Password@123';
  final response =
      await http.get('$url$user');
  final responseJson = json.decode(response.body);
  print(responseJson);
  print(new Post.fromJson(responseJson));
  return new Post.fromJson(responseJson);
  // return responseJson;
}
// Future<Insert> postData(data) async{
//   final response = await http.post(url,body:data);
//   print(response.statusCode);
//   return new Insert.fromJson();
// }