import 'package:dartz/dartz.dart';

import '../../Core/error/faliure.dart';
import '../../Core/services/user.dart';

abstract class LoginRepository{

  Future<Either<Failure, User >> login (String email ,String password);
}