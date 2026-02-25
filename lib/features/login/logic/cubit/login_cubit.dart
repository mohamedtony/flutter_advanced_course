import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/networking/api_result.dart';
import 'package:flutter_advanced_course/features/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_course/features/login/data/repos/login_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_advanced_course/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());

    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (responseBody) {
        emit(LoginState.success(responseBody));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
