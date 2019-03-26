import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_core/common/http/http_manager.dart';
import 'package:flutter_core/common/permission/permission_manager.dart';
import 'package:flutter_core/example/data/base_register.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';

class ASDio {
  ///上传文件
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

  ///formdata post提交
  void register() async {
    var url = "user/register";

    var formdata = FormData.from(
        {"username": "shiyan21", "password": "123456", "repassword": "123456"});

    var result = await HttpManager.getInstance()
        .request(url, data: formdata, method: "post");

    RegisterBase registerBase = RegisterBase.fromJson(result);

    print(registerBase.data.username);
  }

  ///表单post提交
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

  ///下载文件
  downloadFile() async {
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
}
