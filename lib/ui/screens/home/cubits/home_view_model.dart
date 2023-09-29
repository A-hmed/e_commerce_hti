import 'package:e_commerce_hti/ui/screens/home/cubits/categories_cubit.dart';
import 'package:e_commerce_hti/ui/screens/home/cubits/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit {
  CategoriesCubit categoriesCubit = CategoriesCubit();
  ProductsCubit productsCubit = ProductsCubit();
  int currentTabIndex = 0;

  HomeViewModel() : super(HomeScreenInitialState()) {
    categoriesCubit.loadCategoriesList();
    productsCubit.loadProductsList();
  }

  setCurrentTab(int index) {
    currentTabIndex = index;
    emit(HomeScreenInitialState());
  }
}

class HomeScreenInitialState {}
