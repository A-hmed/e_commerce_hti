import 'package:dartz/dartz.dart';
import 'package:e_commerce_hti/domain/model/failure.dart';
import 'package:e_commerce_hti/domain/model/request_body/login_request_body.dart';
import 'package:e_commerce_hti/domain/model/request_body/register_request_body.dart';
import 'package:e_commerce_hti/domain/model/response/auth_response.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login(LoginRequestBody body);

  Future<Either<Failure, AuthResponse>> register(RegisterRequestBody body);
}
