import 'package:dio/dio.dart';
import 'package:flutter_app_boilerplate/common/constant/gitter_constants.dart';

class BaseInterceptor extends InterceptorsWrapper {
  final String baseUrl;

  BaseInterceptor(this.baseUrl);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options
      ..baseUrl = baseUrl
      ..connectTimeout = GitterConstants.timeOut * 1000 //5s
      ..receiveTimeout = GitterConstants.timeOut * 1000
      ..headers.addAll(GitterConstants.headers);
    super.onRequest(options, handler);
  }
}
