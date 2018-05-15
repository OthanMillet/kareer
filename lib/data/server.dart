// import 'package:flutter/material.dart';
// import 'dart:io';
import 'dart:async';
// import 'dart:convert';
import 'package:dio/dio.dart';

Dio dio = new Dio();
String url = "http://system.kareer-ph.com/assets/harmony/mobile.php?";
Response response;

Future<String> getData(data) async {
  response = await dio.get(url+'do-logIn',data:data);
  print(response);
  print(response.data);
  print(response.headers);
  print(response.request); 
  print(url);
  return response.data;
}