import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/Categorie_model.dart';
import 'package:shopapp/models/Home_Model.dart';
import 'package:shopapp/modules/Favourites/favourites_screen.dart';
import 'package:shopapp/modules/categories/categories_screen.dart';
import 'package:shopapp/modules/products/products_screen.dart';
import 'package:shopapp/modules/settings/seeting_screen.dart';
import 'package:shopapp/shared/components/constance.dart';
import 'package:shopapp/shared/network/end_point.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';
part 'shopapp_state.dart';

class ShopappCubit extends Cubit<ShopappState> {
  ShopappCubit() : super(ShopappInitial());

  static ShopappCubit get(context) => BlocProvider.of(context);

  int curreentIndex = 0;

  List<Widget> bottomscreen = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettingsScreen(),
  ];

  void changeBottom(int index) {
    curreentIndex = index;
    emit(ShopChangeBottomNavBarState());
  }

  Map<int, bool> favourites = {};

  HomeModel? homeModel;
  void getHomeData() {
    emit(ShopeLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data!.products.forEach((element) {
        favourites.addAll({
          element.id!: element.in_Favorites!,
        });
      });

      print(favourites.toString());

      emit(ShopeSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopeErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoriesData() {
    DioHelper.getData(url: GET_CATEGORIES, token: token).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopeSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopeErrorCategorieState());
    });
  }
}
