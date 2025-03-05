import 'package:dalcioteca_mobile/core/exception/service_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/core/rest_client/rest_client.dart';
import 'package:dalcioteca_mobile/domain/models/material_model.dart';
import 'package:dalcioteca_mobile/domain/repository/material/material_repository_impl.dart';
import 'package:dalcioteca_mobile/domain/service/material/material_service.dart';

class MaterialServiceImpl extends RestClient with MaterialService {
  final _repository = MaterialRepositoryImpl();

  @override
  Future<Either<ServiceException, List<MaterialModel>>> search(
      {String? name, String? description, String? categoryId}) async {
    final result = await _repository.search(
      name: name,
      description: description,
      categoryId: categoryId,
    );

    switch (result) {
      case Success(:final value):
        return Success(value);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }
}
