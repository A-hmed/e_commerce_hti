import 'package:dartz/dartz.dart';
import 'package:e_commerce_hti/data/repositories/auth_repo/auth_repo_impl.dart';
import 'package:e_commerce_hti/domain/model/failure.dart';
import 'package:e_commerce_hti/domain/model/request_body/login_request_body.dart';
import 'package:e_commerce_hti/domain/model/response/auth_response.dart';
import 'package:e_commerce_hti/domain/repositories/auth_repo/auth_repo.dart';
import 'package:e_commerce_hti/ui/utils/base_request_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<BaseRequestStates> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  AuthRepo repo = AuthRepoImpl();

  LoginViewModel() : super(BaseRequestInitialState());

  void login() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseRequestLoadingState());
    Either<Failure, AuthResponse> response = await repo.login(LoginRequestBody(
        email: emailController.text, password: passwordController.text));

    response.fold((l) {
      emit(BaseRequestErrorState(l.message));
    }, (r) {
      emit(BaseRequestSuccessState());
    });
  }
}
