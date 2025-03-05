import 'package:dalcioteca_mobile/core/exception/service_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/material_model.dart';

mixin MaterialService {
  Future<Either<ServiceException, List<MaterialModel>>> search({
    String? name,
    String? description,
    String? categoryId,
  });
}
