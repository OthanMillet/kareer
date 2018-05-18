import 'dart:async';
import 'package:dio/dio.dart';

Dio dio = new Dio();
// String url = "http://192.168.1.11/kareerServer/assets/harmony/mobile.php?";
String url = "http://system.kareer-ph.com/assets/harmony/mobile.php?";
Response response;

Future<String> getData(tag, data) async {
  response = await dio.get(url+'$tag',data:data);
  return response.data;
}