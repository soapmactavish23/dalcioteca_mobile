
import 'package:dalcioteca_mobile/core/exception/service_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/category_model.dart';

mixin CategoryService {
  Future<Either<ServiceException, List<CategoryModel>>> findAll();
}