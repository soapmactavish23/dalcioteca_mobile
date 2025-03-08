import 'dart:developer';

import 'package:dalcioteca_mobile/core/exception/repository_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/core/rest_client/rest_client.dart';
import 'package:dalcioteca_mobile/domain/models/material_model.dart';
import 'package:dalcioteca_mobile/domain/repository/material/material_repository.dart';

class MaterialRepositoryImpl extends RestClient with MaterialRepository {
  @override
  Future<Either<RepositoryException, List<MaterialModel>>> search(
      {String? name = '',
      String? description = '',
      String? categoryId = ''}) async {
    try {
      final response = await auth.get('/material', queryParameters: {
        'name': name,
        'description': description,
        'categoryId': categoryId,
        'page': 0,
        'size': 10,
      });
      final data = response.data['content'];
      final listMap = List<Map<String, dynamic>>.from(data).toList();
      List<MaterialModel> list =
          listMap.map((e) => MaterialModel.fromMap(e)).toList();
      return Success(list);
    } on Exception catch (e, s) {
      const msg = 'Erro ao pesquisar materiais';
      log(msg, error: e, stackTrace: s);
      return Failure(RepositoryException(message: msg));
    }
  }
}
