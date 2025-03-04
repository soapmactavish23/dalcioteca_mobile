import 'package:dalcioteca_mobile/core/exception/repository_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/core/fp/nil.dart';
import 'package:dalcioteca_mobile/core/auth/models/group.dart';

mixin GroupRepository {
  Future<Either<RepositoryException, Group>> create(Group obj);
  Future<Either<RepositoryException, Group>> update(Group obj);
  Future<Either<RepositoryException, Nil>> deleteById(int id);
  Future<Either<RepositoryException, Group>> findById(int id);
  Future<Either<RepositoryException, List<Group>>> findAll();
}
