import 'package:dartz/dartz.dart';
import 'package:e_commerce_hti/data/repositories/auth_repo/auth_repo_impl.dart';
import 'package:e_commerce_hti/domain/model/failure.dart';
import 'package:e_commerce_hti/domain/model/request_body/register_request_body.dart';
import 'package:e_commerce_hti/domain/model/response/auth_response.dart';
import 'package:e_commerce_hti/domain/repositories/auth_repo/auth_repo.dart';
import 'package:e_commerce_hti/ui/utils/base_request_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<BaseRequestStates> {
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  AuthRepo repo = AuthRepoImpl();

  RegisterViewModel() : super(BaseRequestInitialState());

  void register() async {
    if (!formKey.currentState!.validate()) return;
    emit(BaseRequestLoadingState());
    Either<Failure, AuthResponse> response = await repo.register(
        RegisterRequestBody(
            email: emailController.text,
            password: passwordController.text,
            name: nameController.text,
            rePassword: rePasswordController.text,
            phoneNumber: phoneController.text));

    response.fold((l) {
      emit(BaseRequestErrorState(l.message));
    }, (r) {
      emit(BaseRequestSuccessState());
    });
  }
}
