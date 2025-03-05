import 'package:dalcioteca_mobile/core/exception/service_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/core/rest_client/rest_client.dart';
import 'package:dalcioteca_mobile/domain/models/file_model.dart';
import 'package:dalcioteca_mobile/domain/repository/file/file_repository_impl.dart';
import 'package:dalcioteca_mobile/domain/service/file/file_service.dart';

class FileServiceImpl extends RestClient with FileService {
  final _repository = FileRepositoryImpl();

  @override
  Future<Either<ServiceException, List<FileModel>>> findByMaterial(
      int materialId) async {
    final result = await _repository.findByMaterial(materialId);

    switch (result) {
      case Success(:final value):
        return Success(value);
      case Failure(:final exception):
        return Failure(ServiceException(message: exception.message));
    }
  }
}
