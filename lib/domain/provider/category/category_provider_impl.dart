import 'package:dalcioteca_mobile/core/auth/models/user.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/category_model.dart';
import 'package:dalcioteca_mobile/domain/provider/category/category_provider.dart';
import 'package:dalcioteca_mobile/domain/service/category/category_service_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryProviderImpl extends ChangeNotifier with CategoryProvider {
  List<CategoryModel> list = [];
  bool _loading = false;

  bool get loading {
    return _loading;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final service = CategoryServiceImpl();

  void updateUser(User? user) {
    if (user != null) {
      findAll();
    }
  }

  @override
  Future<void> findAll() async {
    loading = true;
    final result = await service.findAll();
    loading = false;

    switch (result) {
      case Success(:final value):
        list = value;
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }
}
