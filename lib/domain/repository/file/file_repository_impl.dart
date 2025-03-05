import 'dart:developer';

import 'package:dalcioteca_mobile/core/exception/repository_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/core/rest_client/rest_client.dart';
import 'package:dalcioteca_mobile/domain/models/file_model.dart';
import 'package:dalcioteca_mobile/domain/repository/file/file_repository.dart';

class FileRepositoryImpl extends RestClient with FileRepository {
  @override
  Future<Either<RepositoryException, List<FileModel>>> findByMaterial(
      int materialId) async {
    try {
      final response = await auth.get('/arquivos/$materialId');
      final list = List<Map<String, dynamic>>.from(response.data);
      return Success(list.map<FileModel>((e) => FileModel.fromMap(e)).toList());
    } on Exception catch (e, s) {
      const msg = 'Erro ao listar arquivos';
      log(msg, error: e, stackTrace: s);
      return Failure(RepositoryException(message: msg));
    }
  }
}
