import 'package:dartz/dartz.dart';
import 'package:task_login/Core/services/user.dart';
import 'package:task_login/Domain/repository/login_repository.dart';

import '../../Core/error/faliure.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase(this.loginRepository);

  Future<Either<Failure, User>> execute(String email, String password) =>
      loginRepository.login(email, password);
}
