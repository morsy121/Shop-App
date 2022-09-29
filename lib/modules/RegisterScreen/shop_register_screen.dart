import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/Shop_Layout_Screen.dart';
import 'package:shopapp/modules/LoginScreen/cubit/cubit.dart';
import 'package:shopapp/modules/RegisterScreen/cubit/cubit.dart';
import 'package:shopapp/modules/RegisterScreen/cubit/state.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/network/local/cahchhelper.dart';

import '../../shared/components/constance.dart';

class ShopRegisterScreen extends StatelessWidget {
  ShopRegisterScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopLRegisterSuccessStates) {
            if (state.loginModel.status!) {
              showToast(
                  message: state.loginModel.message!,
                  state: ToastState.success);
              token = state.loginModel.data!.token!;
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data!.token)
                  .then((value) {
                //token = state.loginModel.data!.token!;
                navigateAndFinish(context, ShopLayoutScreen());
              });
            }
          } else if (state is ShopRegisterErrorStates) {
            print(state.error);
            showToast(message: state.error, state: ToastState.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Register Now to browse our hot offers",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            lable: 'User Name',
                            prefix: Icons.person,
                            vaildate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please Enter Your Name ';
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            lable: 'Email Address',
                            prefix: Icons.email_outlined,
                            vaildate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please Enter Your Email ';
                              }
                            }),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          isPassword: ShopRegisterCubit.get(context).isPassword,
                          suffix: ShopRegisterCubit.get(context).suffix,
                          onSubmit: (value) {},
                          suffixPressd: () {
                            ShopRegisterCubit.get(context)
                                .changePasswordVisiability();
                          },
                          lable: 'Password Address',
                          vaildate: (String? value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'Password is too short';
                            }
                          },
                          prefix: Icons.lock_outlined,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            lable: 'Phone Number',
                            prefix: Icons.phone,
                            vaildate: (String? value) {
                              if (value!.isEmpty) {
                                return 'please Enter Your Phone ';
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        ConditionalBuilder(
                          condition: state is! ShopRegisterLoadingStates,
                          builder: (context) => defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  ShopRegisterCubit.get(context).userRegister(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text);
                                }
                              },
                              text: 'Register',
                              isUppercase: true,
                              background: Colors.blue),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
