//import '../login/models/login_entity.dart';
//import '../order/models/search_entity.dart';
//import '../user/models/user_entity.dart';
//
//import 'order/models/search_entity.dart';
// todo 修改为接口实现
class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
//    } else if (T.toString() == 'SearchEntity') {
//      return SearchEntity.fromJson(json) as T;
//    } else if (T.toString() == 'UserEntity') {
//      return UserEntity.fromJson(json) as T;
//    } else if (T.toString() == 'LoginEntity') {
//      return LoginEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}