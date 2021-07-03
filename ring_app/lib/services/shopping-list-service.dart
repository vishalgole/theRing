import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ring_app/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../utils/requestObject.dart';

class ShopplingListService {
  var _dio = Dio();
  final requestObj = RequestObject();

  Future<dynamic> getShoppingList({
    latitude,
    longitude,
    products,
    filter,
    distance,
    required city,
    required limit,
    required offset,
  }) async {
    _dio.options.baseUrl = baseURL;
    Map<String, dynamic> payload = requestObj.setRequestPayload(
      latitude,
      longitude,
      products,
      filter,
      distance,
      city,
      limit,
      offset,
    );
    print("$payload");
    var response = await _dio.get(
      "browse/shops",
      queryParameters: payload,
    );
    print("Response {$response}");
    return response;
  }
}
