import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/network/local/cahchhelper.dart';

import '../../modules/LoginScreen/shopLoginScreen.dart';

void SignOut(context) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value) {
      token = '';
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

String token = '';
