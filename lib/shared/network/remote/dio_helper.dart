import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


abstract class DioHelper {

  Future<Response> getData({
    @required String url,
    dynamic query,
  });

}

class DioImplementation extends DioHelper {

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api/',
      receiveDataWhenStatusError: true,
    ),
  );

  @override
  Future<Response> getData({String url,query}) async {
    return await dio.get(url, queryParameters: query);
  }

}
