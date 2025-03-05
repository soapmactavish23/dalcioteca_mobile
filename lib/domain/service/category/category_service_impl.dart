import 'package:dalcioteca_mobile/core/exception/service_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/core/rest_client/rest_client.dart';
import 'package:dalcioteca_mobile/domain/models/category_model.dart';
import 'package:dalcioteca_mobile/domain/repository/category/category_repository_impl.dart';
import 'package:dalcioteca_mobile/domain/service/category/category_service.dart';

class CategoryServiceImpl extends RestClient with CategoryService {
  final _repository = CategoryRepositoryImpl();

  @override
  Future<Either<ServiceException, List<CategoryModel>>> findAll() async {
    final result = await _repository.findAll();
    switch (result) {
      case Success(:final value):
        return Success(value);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }
}
