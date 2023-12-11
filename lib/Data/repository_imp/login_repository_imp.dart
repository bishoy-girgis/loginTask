import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../Core/error/faliure.dart';
import '../../Core/services/user.dart';
import '../../Domain/repository/login_repository.dart';
import '../data_source/login_datasource.dart';

class LoginRepositoryImp implements LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImp(this.loginDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      var result = await loginDataSource.login(email, password);
      User user = User.fromJson(result.data);
      return Right(user);
    } catch (e) {
      DioException error = e as DioException;
      return left(
        Failure(
          statusCode: error.response?.statusCode.toString() ?? "",
        ),
      );
    }
  }
}
