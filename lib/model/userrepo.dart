import 'dart:convert';

import '../helper/constants.dart';
import '../helper/net_utils.dart';
import '../helper/shared_preferences.dart';

/// 网络层
///
/// 提供网络层接口
class UserService {
  /// 登录
  Stream info() => get("/api/v1/user/info");
}

/// 仓库层
///
/// 当请求开始时：处理ViewModel层传递过来的参数
/// 当返回数据时：将网络和本地的数据组装成ViewModel层需要的数据类型
class UserRepo {
  final UserService remote;

  /// sharedPreference
  ///
  /// 也应该算在Model层，在这里面处理数据的读取

  UserRepo({this.remote});

  /// 登录
  ///
  /// - 将ViewModel层 传递过来的[username] 和 [password] 处理为 token 并用[SharedPreferences]进行缓存
  /// - 调用 [_remote] 的 [info] 方法进行网络访问
  /// - 返回 [Stream] 给ViewModel层
  Stream info() {
    return remote.info();
  }
}
