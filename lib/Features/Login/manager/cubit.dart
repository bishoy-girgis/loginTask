import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_login/Features/Login/manager/states.dart';

import '../../../Data/data_source/login_datasource.dart';
import '../../../Data/repository_imp/login_repository_imp.dart';
import '../../../Domain/repository/login_repository.dart';
import '../../../Domain/usecase/login_usecase.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit() : super(LoginInitState());
  late LoginDataSource loginDataSource;
  late LoginRepository loginRepository;
  late LoginUseCase loginUseCase;

  LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  RememberMe(){
    rememberMe = ! rememberMe;
    emit(RememberMeState());
  }


  void logIn() async {
    emit(LoginLoadingState());

    loginDataSource = LoginDataSource();
    loginRepository = LoginRepositoryImp(loginDataSource);
    loginUseCase = LoginUseCase(loginRepository);

    var result = await loginUseCase.execute(
      emailController.text,
      passwordController.text,
    );

    result.fold(
          (fail) {
        emit(LoginErrorState(fail));
      },
          (user) {
        emit(LoginSuccessState(user));
      },
    );
  }
}
