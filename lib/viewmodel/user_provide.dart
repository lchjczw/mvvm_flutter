import 'package:dio/dio.dart';
import 'package:mvvm_flutter/model/userrepo.dart';
import 'package:rxdart/rxdart.dart';

import '../model/repository.dart';
import '../view/base.dart';

/// ViewModel 层
///
/// 将 Model层 [GithubRepo] 返回的数据转换成 View 层 [HomePage] 需要展示的数据
/// 通过 [notifyListeners] 通知UI层更新
class UserProvide extends BaseProvide implements Init {
  UserRepo userRepo = UserRepo(remote: UserService());
  String userName = "";
  String userToken = "";
  String userVarl = '';
  bool _loading = false;

  /// 结果
  String _response = "";

  String get response => _response;

  set response(String response) {
    _response = response;
    notify();
  }

  bool get loading => _loading;

  set loading(bool loading) {
    _loading = loading;
    notify();
  }

  /// 登录
  ///
  /// 调用 model层[GithubRepo] 的 login 方法进行登录
  /// 传入 [username] 和 [password]
  /// 成功：显示返回的信息
  /// 失败: 处理错误，显示错误信息
  /// 订阅开始：loading = true
  /// 订阅结束：loading = false
  /// 返回 [Stream] 给 View 层
  Stream userInfo() => userRepo
      .info()
      .doOnData((r) => response = r.toString())
      .doOnError((e, stacktrace) {
        if (e is DioError) {
          response = e.response.data.toString();
        }
      })
      .doOnListen(() => loading = true)
      .doOnDone(() => loading = false);

  @override
  void init() {}
}
