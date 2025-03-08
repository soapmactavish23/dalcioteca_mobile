import 'package:dalcioteca_mobile/core/auth/models/dto/profile_register_dto.dart';

mixin UserProvider {
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<void> save();
  Future<void> delete();
  Future<void> findById(String code);
  Future<void> editProfile();
  Future<void> signUp(ProfileRegisterDto dto);
}
