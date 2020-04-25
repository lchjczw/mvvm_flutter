//import '../common/common.dart';
//import '../entity_factory.dart';
//import '../generated/json/base/json_convert_content.dart';

import '../common/common.dart';

import '../entity_factory.dart';

class BaseEntity<T> {
  int code;
  String message;
  T data;
  List<T> listData = [];

  BaseEntity(this.code, this.message, this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    // 处理错误
    if (json.containsKey(Constant.error)) {
      json = json[Constant.error];
    }
    code = json[Constant.code];
    message = json[Constant.message];
    if(json.containsKey(Constant.data)){
      json = json[Constant.data];
      // 处理列表
      if (json.containsKey(Constant.list)) {
        (json[Constant.list] as List).forEach((item) {
          listData.add(_generateOBJ<T>(item));
        });
      } else {
        data = _generateOBJ(json);
      }
    }
  }

  S _generateOBJ<S>(json) {
    if (S.toString() == 'String') {
      return json.toString() as S;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as S;
    } else {
      return EntityFactory.generateOBJ(json);
//      return JsonConvert.fromJsonAsT<S>(json);
    }
  }
}
