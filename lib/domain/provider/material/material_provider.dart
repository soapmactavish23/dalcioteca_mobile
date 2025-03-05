import 'package:dalcioteca_mobile/core/auth/models/user.dart';

mixin MaterialProvider {
  Future<void> search({
    String? name,
    String? description,
    String? categoryId,
  });

  void updateUser(User? user);
}
