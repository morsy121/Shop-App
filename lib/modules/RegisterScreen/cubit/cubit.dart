import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/login_model.dart';
import 'package:shopapp/modules/LoginScreen/cubit/states.dart';
import 'package:shopapp/modules/RegisterScreen/cubit/state.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

import '../../../shared/network/end_point.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialStates());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  ShopLoginModel? loginModel;

  void userRegister({
    @required String? name,
    @required String? email,
    @required String? password,
    @required String? phone,
  }) {
    emit(ShopRegisterLoadingStates());
    DioHelper.postData(url: REGISTER, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone
    }).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      if (loginModel!.status!) {
        emit(ShopLRegisterSuccessStates(loginModel!));
      } else {
        emit(ShopRegisterErrorStates(loginModel!.message!));
      }
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorStates(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisiability() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShopRegisterChangePasswordVisiabilityStates());
  }
}
