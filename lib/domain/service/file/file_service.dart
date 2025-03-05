
import 'package:dalcioteca_mobile/core/exception/service_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/file_model.dart';

mixin FileService {
  Future<Either<ServiceException, List<FileModel>>> findByMaterial(int materialId);
}