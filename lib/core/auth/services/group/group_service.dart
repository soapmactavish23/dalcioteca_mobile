import 'package:dalcioteca_mobile/core/exception/service_exception.dart';
import 'package:dalcioteca_mobile/core/fp/either.dart';
import 'package:dalcioteca_mobile/core/fp/nil.dart';
import 'package:dalcioteca_mobile/core/auth/models/group.dart';

mixin GroupService {
  Future<Either<ServiceException, Group>> create(Group obj);
  Future<Either<ServiceException, Group>> update(Group obj);
  Future<Either<ServiceException, Nil>> deleteById(int id);
  Future<Either<ServiceException, Group>> findById(int id);
  Future<Either<ServiceException, List<Group>>> findAll();
}
