import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_hti/domain/model/failure.dart';
import 'package:e_commerce_hti/domain/model/request_body/login_request_body.dart';
import 'package:e_commerce_hti/domain/model/request_body/register_request_body.dart';
import 'package:e_commerce_hti/domain/model/response/auth_response.dart';
import 'package:e_commerce_hti/domain/repositories/auth_repo/auth_repo.dart';
import 'package:e_commerce_hti/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, AuthResponse>> login(LoginRequestBody body) async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.login);
    try {
      Response response = await post(url, body: body.toJson());
      AuthResponse authResponse =
          AuthResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var sharedPref = await SharedPreferences.getInstance();
        sharedPref.setString("token", authResponse.token!);
        User.currentToken = authResponse.token ?? "";
        return Right(authResponse);
      } else {
        throw Exception(authResponse.message);
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(
      RegisterRequestBody body) async {
    Uri url = Uri.https(EndPoints.baseUrl, EndPoints.register);
    try {
      Response response = await post(url, body: body.toJson());
      AuthResponse authResponse =
          AuthResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var sharedPref = await SharedPreferences.getInstance();
        sharedPref.setString("token", authResponse.token!);
        User.currentToken = authResponse.token ?? "";
        return Right(authResponse);
      } else {
        throw Exception(authResponse.message);
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
