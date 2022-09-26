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
