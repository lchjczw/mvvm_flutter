import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
//import '../account/account_router.dart';
//import '../browser/browser_routers.dart';
//import '../goods/goods_router.dart';
import '404.dart';
//import '../login/login_router.dart';
//import '../order/order_router.dart';
import 'router_init.dart';
//import '../setting/setting_router.dart';

//import '../home/home_page.dart';
//import '../home/webview_page.dart';
//import '../shop/shop_router.dart';
//import '../statistics/statistics_router.dart';
//import '../store/store_router.dart';
//import '../user/user_router.dart';

class Routes {
  static String home = '/home';
  static String webViewPage = '/webview';

  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint('未找到目标页');
      return WidgetNotFound();
    });

    router.define(home,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    Home()));

    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(title: title, url: url);
    }));

    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    //    _listRouter.add(ShopRouter());
    //    _listRouter.add(LoginRouter());
    //    _listRouter.add(GoodsRouter());
    //    _listRouter.add(OrderRouter());
    //    _listRouter.add(StoreRouter());
    //    _listRouter.add(AccountRouter());
    //    _listRouter.add(SettingRouter());
    //    _listRouter.add(StatisticsRouter());
    //    _listRouter.add(BrowserRouter());
    //    _listRouter.add(UserRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
