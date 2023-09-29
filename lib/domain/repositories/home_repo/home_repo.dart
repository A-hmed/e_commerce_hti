import 'package:dartz/dartz.dart';
import 'package:e_commerce_hti/domain/model/failure.dart';
import 'package:e_commerce_hti/domain/model/response/categories_response.dart';
import 'package:e_commerce_hti/domain/model/response/products_response.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<Category>>> loadCategories();

  Future<Either<Failure, List<Product>>> loadProducts();
}
