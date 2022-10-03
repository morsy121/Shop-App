part of 'shopapp_cubit.dart';

@immutable
abstract class ShopappState {}

class ShopappInitial extends ShopappState {}

class ShopChangeBottomNavBarState extends ShopappState {}

class ShopeLoadingHomeDataState extends ShopappState {}

class ShopeSuccessHomeDataState extends ShopappState {}

class ShopeErrorHomeDataState extends ShopappState {}

class ShopeSuccessCategoriesState extends ShopappState {}

class ShopeErrorCategorieState extends ShopappState {}

class ShopeSuccessChangeFavouritesState extends ShopappState {
  final ChangeFavouritesModel model;

  ShopeSuccessChangeFavouritesState(this.model);
}

class ShopeErrorChangeFavouritesState extends ShopappState {}

class ShopeChangeFavouritesState extends ShopappState {}

class ShopeLoadingGetFavouritesState extends ShopappState {}

class ShopeSuccessGetFavouritesState extends ShopappState {}

class ShopeErrorGetFavouritesState extends ShopappState {}

class ShopeLoadingUserDataState extends ShopappState {}

class ShopeSuccessUserDatasState extends ShopappState {
  final ShopLoginModel loginModel;

  ShopeSuccessUserDatasState(this.loginModel);
}

class ShopeErrorUserDataState extends ShopappState {}

class ShopeLoadindUpdateProfileState extends ShopappState {}

class ShopeSuccessdUpdateProfileState extends ShopappState {
  final ShopLoginModel loginModel;

  ShopeSuccessdUpdateProfileState(this.loginModel);
}

class ShopeErrodUpdateProfileState extends ShopappState {
  final String error;

  ShopeErrodUpdateProfileState(this.error);
}

class ShopeLoadingGetProductDetailsState extends ShopappState {}

class ShopeSuccessGetProductDetailsState extends ShopappState {}

class ShopeErrorGetProductDetailsState extends ShopappState {
  final String error;

  ShopeErrorGetProductDetailsState(this.error);
}

class ShopLoadingChangeCartState extends ShopappState {}

class ShopSuccessChangeCartState extends ShopappState {}

class ShopErrorChangeCartState extends ShopappState {}

class ShopLoadingGetCartState extends ShopappState {}

class ShopSuccessGetCartState extends ShopappState {}

class ShopErrorGetCartState extends ShopappState {}
