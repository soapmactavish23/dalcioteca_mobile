import 'package:dalcioteca_mobile/core/auth/models/user.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/material_model.dart';
import 'package:dalcioteca_mobile/domain/provider/material/material_provider.dart';
import 'package:dalcioteca_mobile/domain/service/material/material_service_impl.dart';
import 'package:flutter/material.dart';

class MaterialProviderImpl extends ChangeNotifier with MaterialProvider {
  final _service = MaterialServiceImpl();

  List<MaterialModel> list = [];
  bool _loading = false;

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  @override
  void updateUser(User? user) {
    if (user != null) {
      search();
    }
  }

  @override
  Future<void> search(
      {String? name, String? description, String? categoryId}) async {
    loading = true;
    final result = await _service.search(
        name: name, description: description, categoryId: categoryId);
    loading = false;

    switch (result) {
      case Success(:final value):
        list = value;
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }
}
