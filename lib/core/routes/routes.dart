import 'package:dalcioteca_mobile/views/base/base_view.dart';
import 'package:dalcioteca_mobile/views/login/login_view.dart';
import 'package:dalcioteca_mobile/views/material/MaterialView.dart';
import 'package:dalcioteca_mobile/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:dalcioteca_mobile/core/routes/router_name.dart';

class Routes {
  static Route<dynamic> onGenereteRoute(RouteSettings settings) {
    switch (settings.name) {
      //Client Views
      case RouterName.baseRoute:
        return MaterialPageRoute(builder: (_) => BaseView());
      case RouterName.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case RouterName.materialRoute:
        return MaterialPageRoute(builder: (_) => const MaterialView());
      default:
        return MaterialPageRoute(builder: (_) => const SplashView());
    }
  }
}
