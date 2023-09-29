import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_hti/domain/model/failure.dart';
import 'package:e_commerce_hti/domain/model/response/categories_response.dart';
import 'package:e_commerce_hti/domain/model/response/products_response.dart';
import 'package:e_commerce_hti/domain/repositories/home_repo/home_repo.dart';
import 'package:e_commerce_hti/ui/utils/end_points.dart';
import 'package:http/http.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<Category>>> loadCategories() async {
    //https://ecommerce.routemisr.com/api/v1/categories
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.categories);
      Response response = await get(url);
      CategoriesResponse categoriesResponse =
          CategoriesResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          categoriesResponse.data?.isNotEmpty == true) {
        return Right(categoriesResponse.data!);
      } else {
        return Left(
            Failure("Failed to load categories please try again later"));
      }
    } catch (e) {
      return Left(Failure("Failed to load categories please try again later"));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> loadProducts() async {
    //https://ecommerce.routemisr.com/api/v1/categories
    try {
      Uri url = Uri.https(EndPoints.baseUrl, EndPoints.categories);
      Response response = await get(url);
      ProductsResponse productsResponse =
          ProductsResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 &&
          response.statusCode < 300 &&
          productsResponse.data?.isNotEmpty == true) {
        return Right(productsResponse.data!);
      } else {
        return Left(
            Failure("Failed to load categories please try again later"));
      }
    } catch (e) {
      return Left(Failure("Failed to load categories please try again later"));
    }
  }
}
