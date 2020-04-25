class Constant {
  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = const bool.fromEnvironment('dart.vm.product');

  static bool isDriverTest  = false;
  static bool isUnitTest  = false;

  static const String data = 'data';
  static const String list = 'list';
  static const String error = 'error';
  static const String message = 'message';
  static const String code = 'code';
  
  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refreshToken';

  static const String theme = 'AppTheme';

//  static const String baseUrl = 'https://api.github.com/'; //服务器域名
  static const String baseUrl = 'http://lottery.xiguandaka.com'; //服务器域名

}
