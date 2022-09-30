import 'package:shopapp/models/login_model.dart';

abstract class ShopRegisterStates {}

class ShopRegisterInitialStates extends ShopRegisterStates {}

class ShopRegisterLoadingStates extends ShopRegisterStates {}

class ShopLRegisterSuccessStates extends ShopRegisterStates {
  final ShopLoginModel loginModel;

  ShopLRegisterSuccessStates(this.loginModel);
}

class ShopRegisterErrorStates extends ShopRegisterStates {
  final String error;

  ShopRegisterErrorStates(this.error);
}

class ShopRegisterChangePasswordVisiabilityStates extends ShopRegisterStates {}
