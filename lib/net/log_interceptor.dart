import 'package:dio/dio.dart';

/*
 * 页面说明：dio 网络请求拦截日志
 * 功能性修改记录：
 */
class LogsInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("\n================== 请求数据 ==========================");
    print("|请求url：${options.path}");
    print('|请求头: ' + options.headers.toString());
    print('|请求参数: ' + options.queryParameters.toString());
    print('|请求方法: ' + options.method);
    print("|contentType = ${options.contentType}");
    print('|请求时间: ' + DateTime.now().toString());
    if (options.data != null) {
      print('|请求数据: ' + options.data.toString());
    }

    return Future.value(options);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) {
    print("\n|================== 响应数据 ==========================");
    if (response != null) {
      print("|url = ${response.redirects}");
      print("|code = ${response.statusCode}");
      print("|data = ${response.data}");
      print('|返回时间: ' + DateTime.now().toString());
      print("\n");
    } else {
      print("|data = 请求错误 E409");
      print('|返回时间: ' + DateTime.now().toString());
      print("\n");
    }

    return Future.value(response);
  }

  @override
  Future onError(DioError e, ErrorInterceptorHandler handler) {
    print("\n================== 错误响应数据 ======================");
    print("|url = ${e.requestOptions.path}");
    print("|type = ${e.type}");
    print("|message = ${e.message}");

    print('|response = ${e.response}');
    print("\n");

    return Future.value(e);
  }
}
