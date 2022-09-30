import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/Categorie_model.dart';
import 'package:shopapp/models/Favourites_model.dart';
import 'package:shopapp/models/UserModel.dart';
import 'package:shopapp/models/change_Favourites_model.dart';
import 'package:shopapp/models/Home_Model.dart';
import 'package:shopapp/models/login_model.dart';
import 'package:shopapp/modules/Favourites/favourites_screen.dart';
import 'package:shopapp/modules/LoginScreen/cubit/cubit.dart';
import 'package:shopapp/modules/categories/categories_screen.dart';
import 'package:shopapp/modules/products/products_screen.dart';
import 'package:shopapp/modules/settings/seeting_screen.dart';
import 'package:shopapp/shared/components/constance.dart';
import 'package:shopapp/shared/network/end_point.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

import '../../models/product_details_screen.dart';
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

  HomeModel? homeModel;

  Map<int, bool> favourites = {};

  void getHomeData() {
    emit(ShopeLoadingHomeDataState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      homeModel!.data!.products.forEach((element) {
        favourites.addAll({
          element.id!: element.inFavorites!,
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

  ChangeFavouritesModel? changefavouritesModel;
  void changeFavourites(int productId) {
    favourites[productId] = !favourites[productId]!;
    emit(ShopeChangeFavouritesState());
    DioHelper.postData(
            url: FAVOURITS, data: {'product_id': productId}, token: token)
        .then((value) {
      changefavouritesModel = ChangeFavouritesModel.fromJson(value.data);

      if (!changefavouritesModel!.status!) {
        favourites[productId] = !favourites[productId]!;
      } else {
        getFavourites();
      }
      //print(changefavouritesModel!.status);
      //print(value.data);
      emit(ShopeSuccessChangeFavouritesState(changefavouritesModel!));
    }).catchError((error) {
      favourites[productId] = !favourites[productId]!;
      emit(ShopeErrorChangeFavouritesState());
    });
  }

  FavouritesModel? favouritesModel;
  void getFavourites() {
    emit(ShopeLoadingGetFavouritesState());
    DioHelper.getData(url: FAVOURITS, token: token).then((value) {
      favouritesModel = FavouritesModel.fromJson(value.data);
      print(value.data.toString());
      emit(ShopeSuccessGetFavouritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopeErrorGetFavouritesState());
    });
  }

  ProductDetailsModel? productDetailsModel;

  void getProductDetails(int productId) {
    emit(ShopeLoadingGetProductDetailsState());
    DioHelper.getData(
      url: PRODUCTDETAILS,
      token: token,
    ).then(
      (value) {
        productDetailsModel = ProductDetailsModel.fromJson(value.data);
        print(value.data);
        emit(ShopeSuccessGetProductDetailsState());
      },
    ).catchError(
      (error) {
        emit(ShopeErrorGetProductDetailsState(error.toString()));
        print(error.toString());
      },
    );
  }

  ShopLoginModel? userModel;
  void getUserData() {
    emit(ShopeLoadingUserDataState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      //print('++++++++++++++++++++++++++++++++++++++++++++++++');
      print(userModel!.data!.phone!);
      //print('++++++++++++++++++++++++++++++++++++++++++++++++');
      print(userModel!.data!.name!);
      emit(ShopeSuccessUserDatasState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopeErrorUserDataState());
    });
  }

  void getUpdateProfileData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopeLoadindUpdateProfileState());
    DioHelper.putData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print('++++++++++++++++++++++++++++++++++++++++++++++++');
      print(userModel!.data!.phone!);
      print('++++++++++++++++++++++++++++++++++++++++++++++++');
      print(userModel!.data!.name!);
      emit(ShopeSuccessdUpdateProfileState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopeErrodUpdateProfileState());
    });
  }
}
