import 'dart:convert';

import 'package:dio/dio.dart';

class CurlInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final curl = _generateCurlCommand(options);
    print('🌀 CURL:\n$curl\n');
    super.onRequest(options, handler);
  }

  String _generateCurlCommand(RequestOptions options) {
    final method = options.method.toUpperCase();
    final buffer = StringBuffer();

    buffer.write('curl -X $method');

    // Add headers
    options.headers.forEach((k, v) {
      buffer.write(' -H "${_escape(k)}: ${_escape(v.toString())}"');
    });

    // Add body if exists
    if (options.data != null) {
      String data;
      if (options.data is Map || options.data is List) {
        data = jsonEncode(options.data);
      } else {
        data = options.data.toString();
      }
      buffer.write(' --data \'${_escape(data)}\'');
    }

    // Add URL
    buffer.write(' "${options.baseUrl}${options.path}"');

    return buffer.toString();
  }

  String _escape(String input) => input.replaceAll('"', r'\"');
}
