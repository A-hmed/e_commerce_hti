import 'package:dartz/dartz.dart';
import 'package:e_commerce_hti/data/repositories/home_repo/home_repo_impl.dart';
import 'package:e_commerce_hti/domain/model/failure.dart';
import 'package:e_commerce_hti/domain/model/response/products_response.dart';
import 'package:e_commerce_hti/domain/repositories/home_repo/home_repo.dart';
import 'package:e_commerce_hti/ui/utils/base_request_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<BaseRequestStates> {
  HomeRepo repo = HomeRepoImpl();
  List<Product> products = [];

  ProductsCubit() : super(BaseRequestInitialState());

  void loadProductsList() async {
    emit(BaseRequestLoadingState());
    Either<Failure, List<Product>> response = await repo.loadProducts();
    response.fold((failure) => emit(BaseRequestErrorState(failure.message)),
        (newList) {
      products = newList;
      print(products);
      emit(BaseRequestSuccessState());
    });
  }
}
