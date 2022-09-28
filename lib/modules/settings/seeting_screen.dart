import 'package:flutter/material.dart';
import 'package:shopapp/modules/LoginScreen/shopLoginScreen.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/network/local/cahchhelper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
      icon: Icon(
        Icons.favorite,
        size: 45,
      ),
      onPressed: () {
        CacheHelper.removeData(key: 'token').then((value) {
          if (value) {
            navigateAndFinish(context, ShopLoginScreen());
          }
        });
      },
    ));
  }
}
