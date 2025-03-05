
import 'package:dalcioteca_mobile/core/exception/repository_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/category_model.dart';

mixin CategoryRepository {
  Future<Either<RepositoryException, List<CategoryModel>>> findAll();
}