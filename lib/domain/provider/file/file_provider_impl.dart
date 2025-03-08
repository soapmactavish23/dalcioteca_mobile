import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/file_model.dart';
import 'package:dalcioteca_mobile/domain/models/material_model.dart';
import 'package:dalcioteca_mobile/domain/provider/file/file_provider.dart';
import 'package:dalcioteca_mobile/domain/service/file/file_service_impl.dart';
import 'package:flutter/material.dart';

class FileProviderImpl extends ChangeNotifier with FileProvider {
  final _service = FileServiceImpl();

  List<FileModel> list = [];

  bool _loading = false;

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  MaterialModel materialSelected = MaterialModel.empty();

  @override
  Future<void> findByMaterial() async {
    loading = true;
    final result = await _service.findByMaterial(materialSelected.id!);
    loading = false;

    switch (result) {
      case Success(:final value):
        list = value;
      case Failure(:final exception):
        return Future.error(exception.message);
    }
  }

  @override
  void updateMaterial(MaterialModel material) {
    if (material.id != null) {
      materialSelected = material;
      findByMaterial();
    }
  }
}
