import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/common/http/api.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

///网络请求管理器
class HttpManager {
  static HttpManager _instance;

  Dio _dio;

  PersistCookieJar _persistCookieJar;

  Map<String, CancelToken> _map = Map();

  factory HttpManager.getInstance() {
    if (null == _instance) {
      _instance = HttpManager._internal();
    }

    return _instance;
  }

  HttpManager._internal() {
    BaseOptions options = BaseOptions(
      ///基础地址
      baseUrl: Api.BASEURL,

      ///连接服务器时间，单位是毫秒
      connectTimeout: 5000,

      ///读取超时
      receiveTimeout: 3000,
    );

    ///创建dio
    _dio = Dio(options);

    initCookie();

    initLog();
  }

  ///初始化cookie配置
  initCookie() async {
    ///获取应用文件目录
    Directory directory = await getApplicationDocumentsDirectory();

    ///获取cookie本地存储地址
    var path = Directory(join(directory.path, "cookie")).path;
    debugPrint("path:$path");

    _persistCookieJar = PersistCookieJar(dir: path);

    _dio.interceptors.add(CookieManager(_persistCookieJar));
  }

  ///发送请求
  request(String url,
      {data, method = "get", headers, onReceiveProgress, context}) async {
    try {
      if (context != null) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return Center(
                child: CircularProgressIndicator(),
              );
            });
      }

      CancelToken cancelToken = CancelToken();

      ///保存token
      _map[url] = cancelToken;

      Options options = Options(method: method, headers: headers);

      Response response = await _dio.request(url,
          data: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      if (context != null) {
        Navigator.pop(context);
      }

      return response.data;
    } catch (e) {
      print("请求错误:$e");
      return null;
    }
  }

  ///发送请求
  get(String url,
      {Map<String, dynamic> data,
      method = "get",
      headers,
      onReceiveProgress,
      context}) async {
    try {
      if (context != null) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return Center(
                child: CircularProgressIndicator(),
              );
            });
      }

      CancelToken cancelToken = CancelToken();

      ///保存token
      _map[url] = cancelToken;

      Options options = Options(method: method, headers: headers);

      Response response = await _dio.get(url,
          queryParameters: data,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);

      if (context != null) {
        Navigator.pop(context);
      }

      return response.data;
    } catch (e) {
      print("请求错误:$e");
      return null;
    }
  }

  ///发送请求
  post(String url, {data, method = "post", context}) async {
    try {
      if (context != null) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return Center(
                child: CircularProgressIndicator(),
              );
            });
      }
      CancelToken cancelToken = CancelToken();

      ///保存token
      _map[url] = cancelToken;

      Options options = Options(
          method: method,
          contentType: ContentType.parse("application/x-www-form-urlencoded"));

      Response response = await _dio.request(url,
          data: data, options: options, cancelToken: cancelToken);

      if (context != null) {
        Navigator.pop(context);
      }

      return response.data;
    } catch (e) {
      print("请求错误:$e");
      return null;
    }
  }

  ///下载
  download(String url, {ProgressCallback progressCallback}) async {
    CancelToken cancelToken = CancelToken();

    ///保存token
    _map[url] = cancelToken;

    ///获取应用文件目录
    Directory directory = await getExternalStorageDirectory();

    var lastIndexOf = url.lastIndexOf('/');

    ///获取文件名称
    var dstname = url.substring(lastIndexOf + 1, url.length);

    ///获取cookie本地存储地址
    var path = Directory(join(directory.path, dstname)).path;

    Response response = await _dio.download(url, path,
        onReceiveProgress: progressCallback, cancelToken: cancelToken);

    if (response.statusCode == HttpStatus.ok) {
      return true;
    } else {
      return false;
    }
  }

  ///初始化Log配置
  initLog() {
    _dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      request: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  ///取消请求
  cancleRequest(String url) {
    _map[url]?.cancel(url);
  }

  ///清除cookie
  clearCookie() {
    _persistCookieJar?.deleteAll();
  }
}
