import 'package:dalcioteca_mobile/core/exception/repository_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/domain/models/file_model.dart';

mixin FileRepository {
  Future<Either<RepositoryException, List<FileModel>>> findByMaterial(int materialId);
}
