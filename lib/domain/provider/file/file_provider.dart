import 'package:dalcioteca_mobile/domain/models/material_model.dart';

mixin FileProvider {
  void updateMaterial(MaterialModel? material);

  Future<void> findByMaterial();
}
