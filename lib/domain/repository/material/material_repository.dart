import 'package:dalcioteca_mobile/core/exception/repository_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/material_model.dart';

mixin MaterialRepository {
  Future<Either<RepositoryException, List<MaterialModel>>> search({
    String? name,
    String? description,
    String? categoryId,
  });
}
