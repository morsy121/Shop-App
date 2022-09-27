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

class ShopeSuccessUserDatasState extends ShopappState {}

class ShopeErrorUserDataState extends ShopappState {}
