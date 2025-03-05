import 'package:dalcioteca_mobile/core/auth/models/user.dart';

mixin CategoryProvider {
  Future<void> findAll();
  void updateUser(User? user);
}
