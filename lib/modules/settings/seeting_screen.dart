import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/cubit/shopapp_cubit.dart';
import 'package:shopapp/modules/LoginScreen/shopLoginScreen.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/components/constance.dart';
import 'package:shopapp/shared/network/local/cahchhelper.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopappCubit, ShopappState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ShopeLoadingUserDataState) {
          return LinearProgressIndicator();
        } else {
          var model = ShopappCubit.get(context).userModel;
          nameController.text = model!.data!.name!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;
        }

        return ConditionalBuilder(
          condition: ShopappCubit.get(context).userModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  if (state is ShopeLoadindUpdateProfileState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      lable: 'Name',
                      prefix: Icons.person,
                      vaildate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Name must not be empty';
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      lable: 'Email',
                      prefix: Icons.email,
                      vaildate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email must not be empty';
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      lable: 'Phone',
                      prefix: Icons.phone,
                      vaildate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Phone must not be empty';
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    background: Colors.blue,
                    isUppercase: true,
                    width: double.infinity,
                    function: () {
                      if (formKey.currentState!.validate()) {
                        ShopappCubit.get(context).getUpdateProfileData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text);
                      }
                    },
                    text: 'Update Profile',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    background: Colors.blue,
                    isUppercase: true,
                    width: double.infinity,
                    function: () {
                      SignOut(context);
                    },
                    text: 'LOGOUT',
                  ),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
