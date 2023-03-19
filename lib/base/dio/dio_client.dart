import 'package:dio/dio.dart';
import '../../main.dart';

class DioClient {
  /// Data & constructor *************************************
  late Dio dio;
  final String url = 'https://xmeet.beetleware.com/api/';
  final String version = 'v1/';
  String get baseUrl => url + version;

  DioClient() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    addInterceptor(dio);
  }

  void addInterceptor(Dio dio) {
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers.addAll(_headers);
          handler.next(options);
        }, onResponse: (response, handler) {
      handler.resolve(response);
    }, onError: (DioError e, ErrorInterceptorHandler handler) {
      handler.next(e);
    }));
  }

  /// Add Headers *******************************************
  Map<String, String> get _headers => {'Authorization': 'Bearer ${pref.userToken!}'};


}
