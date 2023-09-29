import 'package:dartz/dartz.dart';
import 'package:e_commerce_hti/data/repositories/home_repo/home_repo_impl.dart';
import 'package:e_commerce_hti/domain/model/failure.dart';
import 'package:e_commerce_hti/domain/repositories/home_repo/home_repo.dart';
import 'package:e_commerce_hti/ui/utils/base_request_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/model/response/categories_response.dart';

class CategoriesCubit extends Cubit<BaseRequestStates> {
  HomeRepo repo = HomeRepoImpl();
  List<Category> categoires = [];

  CategoriesCubit() : super(BaseRequestInitialState());

  void loadCategoriesList() async {
    emit(BaseRequestLoadingState());
    Either<Failure, List<Category>> response = await repo.loadCategories();
    response.fold((failure) => emit(BaseRequestErrorState(failure.message)),
        (newList) {
      categoires = newList;
      print(categoires);
      emit(BaseRequestSuccessState());
    });
  }
}
