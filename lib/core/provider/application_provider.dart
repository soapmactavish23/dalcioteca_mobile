import 'package:dalcioteca_mobile/domain/provider/category/category_provider_impl.dart';
import 'package:dalcioteca_mobile/domain/provider/file/file_provider_impl.dart';
import 'package:dalcioteca_mobile/domain/provider/material/material_provider_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dalcioteca_mobile/core/provider/group/group_provider_impl.dart';
import 'package:dalcioteca_mobile/core/provider/user/user_provider_impl.dart';

class ApplicationProvider extends StatelessWidget {
  final Widget materialApp;
  const ApplicationProvider({super.key, required this.materialApp});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProviderImpl(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => GroupProviderImpl(),
          lazy: false,
        ),
        ChangeNotifierProxyProvider<UserProviderImpl, CategoryProviderImpl>(
          create: (_) => CategoryProviderImpl(),
          lazy: false,
          update: (_, objDad, objChild) =>
              objChild!..updateUser(objDad.userLogged),
        ),
        ChangeNotifierProxyProvider<UserProviderImpl, MaterialProviderImpl>(
          create: (_) => MaterialProviderImpl(),
          lazy: false,
          update: (_, objDad, objChild) =>
              objChild!..updateUser(objDad.userLogged),
        ),
        ChangeNotifierProxyProvider<MaterialProviderImpl, FileProviderImpl>(
          create: (_) => FileProviderImpl(),
          lazy: false,
          update: (_, objDad, objChild) =>
              objChild!..updateMaterial(objDad.obj),
        ),
      ],
      child: materialApp,
    );
  }
}
