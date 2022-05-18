import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart' as new_Dio;

class Request {
  final String url;
  final dynamic body;

  Request({required this.url, this.body});

  final new_Dio.Dio _dio = new_Dio.Dio();

  final _baseUrl = 'https://api.covid19api.com';

  Future<new_Dio.Response?> get() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi){
    try {
      new_Dio.Response result = await _dio.get(_baseUrl+url,
          options: new_Dio.Options(
            headers: {
              'X-Access-Token': '5cf9dfd5-3449-485e-b5ae-70a60e997864',
              "content-Type" : 'application/json'
            },
          ));
      return result;
    } on new_Dio.DioError catch (exception) {
      print("exception ($url) : ${exception.response?.statusCode}");
      return exception.response;
    }
    }
    else{
      return new_Dio.Response(requestOptions: new_Dio.RequestOptions(path: ""), statusCode: 10001);
    }
  }


}
