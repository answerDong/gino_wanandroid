import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:gino_wanandroid/common/net_api.dart';
import 'package:gino_wanandroid/common/toast_utils.dart';

class HttpUitls {

  static HttpUitls instance = HttpUitls();
  late Dio dio;
  late BaseOptions options;
  static HttpUitls getInstance() {
    return instance;
  }

  HttpUitls() {
        options = BaseOptions(
        //配置base地址
        baseUrl: NewApi.BASE_URL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {'version': "1.0.0"},
        contentType: Headers.formUrlEncodedContentType,
        responseType: ResponseType.plain);

    //添加配置  cookies管理  拦截器
    dio = Dio(options);
    // dio.interceptors.add(CookieManager(CookieJar()));
    // dio.interceptors.add(InterceptorsWrapper(onRequest: (
    //   options,
    //   handler,
    // ) {
    //   print("http onRequest ${options.data}");
    //   print("http onRequest ${options.data}");
    // }, onResponse: (e, handler) {
    //   print("http response ${e.data}");
    //   print("http response ${e.statusCode}");
    // }, onError: (e, handler) {
    //   print("http onError ${e.error}");
    // }));
  }

  /// get请求
   get(url) async {
    Response? response;
    try {
      response = await dio.get(url);
      // print(response.data.toString());
    } on DioError catch (e) {
      print('get error------------$e');
      formatError(e);
    }
    return response?.data;
  }

  ///post请求
  post(url, {data, options, cancelToken}) async {
    Response? response;
    try {
      response = await dio.post(url,
          queryParameters: data, options: options, cancelToken: cancelToken);
    } on DioError catch (e) {
      print('post------------${response?.data}');
      formatError(e);
    }
    return response?.data;
  }

  ///文件下载
  downLoadFile(urlPath, savePath) async {
    Response? response;
    try {
      response = await dio.download(urlPath, savePath,
          onReceiveProgress: (count, total) {
        print('progress $count     $total');
      });
      print('downLoadFile------------${response?.data}');
    } on DioError catch (e) {
      print('downLoadFile error------------$e');
      formatError(e);
    }
  }

  ///错误统一处理
  void formatError(DioError e) {
    if (e.type == DioErrorType.connectionTimeout) {
      print("连接超时");
    } else if (e.type == DioErrorType.sendTimeout) {
      print("请求超时");
    } else if (e.type == DioErrorType.receiveTimeout) {
      print("响应超时");
    } else if (e.type == DioErrorType.badResponse) {
      print("出现异常");
    } else if (e.type == DioErrorType.cancel) {
      print("请求取消");
    } else {
      print("未知错误");
    }
  }
}
