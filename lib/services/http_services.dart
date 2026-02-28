import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

// https://online-store-qak1.onrender.com
/// ⚠️ IP الكمبيوتر الحقيقي
/// 10.0.2.16
// const String COMPUTER_IP = '10.182.144.167';
const String COMPUTER_IP = '10.0.2.2';

final String MAIN_URL = (() {
  if (kIsWeb) {
    return 'https://online-store-qak1.onrender.com';
  }

  try {
    if (Platform.isAndroid || Platform.isIOS) {
      return 'https://online-store-qak1.onrender.com';
    }
  } catch (_) {}

  return 'https://online-store-qak1.onrender.com';
})();
class HttpService {
  final String baseUrl = MAIN_URL;

  Future<Response> getItems({required String endpointUrl}) async {
    try {
      return await GetConnect().get('$baseUrl/$endpointUrl');
    } catch (e) {
      return Response(body: json.encode({'error': e.toString()}), statusCode: 500);
    }
  }

  Future<Response> addItem({required String endpointUrl, required dynamic itemData}) async {
    try {
      final response = await GetConnect().post('$baseUrl/$endpointUrl', itemData);
      print(response.body);
      return response;
    } catch (e) {
      print('Error: $e');
      return Response(body: json.encode({'message': e.toString()}), statusCode: 500);
    }
  }

  Future<Response> updateItem({required String endpointUrl, required String itemId, required dynamic itemData}) async {
    try {
      return await GetConnect().put('$baseUrl/$endpointUrl/$itemId', itemData);
    } catch (e) {
      return Response(body: json.encode({'message': e.toString()}), statusCode: 500);
    }
  }

  Future<Response> deleteItem({required String endpointUrl, required String itemId}) async {
    try {
      return await GetConnect().delete('$baseUrl/$endpointUrl/$itemId');
    } catch (e) {
      return Response(body: json.encode({'message': e.toString()}), statusCode: 500);
    }
  }
}