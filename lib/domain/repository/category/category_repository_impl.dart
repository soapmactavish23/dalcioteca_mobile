import 'dart:developer';

import 'package:dalcioteca_mobile/core/exception/repository_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/core/rest_client/rest_client.dart';
import 'package:dalcioteca_mobile/domain/models/category_model.dart';
import 'package:dalcioteca_mobile/domain/repository/category/category_repository.dart';

class CategoryRepositoryImpl extends RestClient with CategoryRepository {
  @override
  Future<Either<RepositoryException, List<CategoryModel>>> findAll() async {
    try {
      final response = await unAuth.get('/categorias');
      final list = List<Map<String, dynamic>>.from(response.data).toList();
      return Success(
          list.map<CategoryModel>((e) => CategoryModel.fromMap(e)).toList());
    } on Exception catch (e, s) {
      const msg = 'Erro ao listar as categorias';
      log(msg, error: e, stackTrace: s);
      return Failure(RepositoryException(message: msg));
    }
  }
}
