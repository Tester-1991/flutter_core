import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/common/http/http_manager.dart';
import 'package:flutter_core/common/permission/permission_manager.dart';
import 'package:flutter_core/example/base_register.dart';
import 'package:flutter_core/example/image_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';

void main() {
  runApp(MyApp());
}

requestPermission() async {
  bool requestPermission = await PermissionManager.requestPermission(
      [Permission.WriteExternalStorage]);

  if (!requestPermission) return;

  var result = await HttpManager.getInstance()
      .download("blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
          progressCallback: (received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  });

  if (result) {
    print("下载成功");
  } else {
    print("下载失败");
  }
}

requestPermission2() async {
  var requestPermission = await PermissionManager.requestPermission(
      [Permission.WriteExternalStorage, Permission.Camera]);

  if (requestPermission) {
    print("权限获取成功");
  } else {
    print("权限获取失败");
  }
}

uploadFile() async {
  Directory directory = await getExternalStorageDirectory();

  File file =
      File(directory.path + "/" + "50c115c2-cf6c-4802-aa7b-a4334de444cd.png");

  FormData data = FormData.from({
    "image": UploadFileInfo(file, "50c115c2-cf6c-4802-aa7b-a4334de444cd.png")
  });

  HttpManager.getInstance().request(
      "http://testapp.airspace.cn/api/image/upload",
      data: data,
      method: "post",
      headers: {'Token': '849d769d55344a6cb8261dd6cebf9dc0'},
      onReceiveProgress: (received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image组件"),
        ),
        body: Builder(
          builder: (context) {
            return TestImage();
          },
        ),
      ),
    );
  }
}

void register() async {
  var url = "user/register";

  var formdata = FormData.from(
      {"username": "shiyan21", "password": "123456", "repassword": "123456"});

  var result = await HttpManager.getInstance()
      .request(url, data: formdata, method: "post");

  RegisterBase registerBase = RegisterBase.fromJson(result);

  print(registerBase.data.username);
}

void register2(context) async {
  var url = "user/register";

  var data = {
    "username": "shiyan21",
    "password": "123456",
    "repassword": "123456"
  };

  await HttpManager.getInstance()
      .post(url, data: data, method: "post", context: context);
}
