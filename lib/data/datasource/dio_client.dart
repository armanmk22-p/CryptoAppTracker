import 'package:dio/dio.dart';

import 'constants/api_constants.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    //for single option
    // _dio.options.baseUrl=ApiConstants.baseUrl;
    // _dio.options.connectTimeout=ApiConstants.connectionTimeout;
    // _dio.options.baseUrl=ApiConstants.baseUrl;

    //or for multiple option
    _dio
      ..options.baseUrl = ApiConstants.baseUrl
      ..options.connectTimeout = ApiConstants.connectionTimeout
      ..options.receiveTimeout = ApiConstants.receiveTimeout;
  }

  //Get-------------------------------------------------
  Future<Response> get(String url, {Map<String, dynamic>? queryParameters, Options? options,})async{
    try{
      final Response response = await _dio.get(url,queryParameters: queryParameters,options: options);
      return response;
    }catch(e){
      rethrow;
    }
  }

}