import 'package:e_commerce_hti/ui/screens/home/cubits/home_view_model.dart';
import 'package:e_commerce_hti/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:e_commerce_hti/ui/screens/home/tabs/fav/fav_tab.dart';
import 'package:e_commerce_hti/ui/screens/home/tabs/home/home_tab.dart';
import 'package:e_commerce_hti/ui/screens/home/tabs/profile/profile_tab.dart';
import 'package:e_commerce_hti/ui/utils/app_assets.dart';
import 'package:e_commerce_hti/ui/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "home";
  HomeViewModel viewModel = HomeViewModel();
  List<Widget> tabs = [
    HomeTab(),
    CategoriesTab(),
    FAVTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<HomeViewModel, dynamic>(
        bloc: viewModel,
        builder: (context, _) {
          return Scaffold(
            body: tabs[viewModel.currentTabIndex],
            bottomNavigationBar: Theme(
              data: ThemeData(canvasColor: AppColors.primaryColor),
              child: BottomNavigationBar(
                backgroundColor: AppColors.primaryColor,
                unselectedItemColor: AppColors.whiteColor,
                selectedItemColor: AppColors.primaryColor,
                onTap: (index) {
                  viewModel.setCurrentTab(index);
                },
                iconSize: 35,
                currentIndex: viewModel.currentTabIndex,
                items: [
                  buildBottomNavIcon(
                      AppAssets.icHome, viewModel.currentTabIndex == 0),
                  buildBottomNavIcon(
                      AppAssets.icCategories, viewModel.currentTabIndex == 1),
                  buildBottomNavIcon(
                      AppAssets.icFav, viewModel.currentTabIndex == 2),
                  buildBottomNavIcon(
                      AppAssets.icProfile, viewModel.currentTabIndex == 3),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  buildBottomNavIcon(String asset, bool selected) {
    return BottomNavigationBarItem(
        icon: selected
            ? CircleAvatar(
                radius: selected ? 20 : 0,
                backgroundColor: selected ? Colors.white : Colors.transparent,
                child: ImageIcon(
                  AssetImage(asset),
                  size: 30,
                ))
            : ImageIcon(AssetImage(asset), size: 30),
        label: "");
  }
}
