import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/Shop_Layout_Screen.dart';
import 'package:shopapp/Layout/cubit/shopapp_cubit.dart';
import 'package:shopapp/modules/LoginScreen/shopLoginScreen.dart';
import 'package:shopapp/modules/onBoarding/onBoarding_screen.dart';
import 'package:shopapp/shared/components/constance.dart';
import 'package:shopapp/shared/cubit/appcubit_cubit.dart';
import 'package:shopapp/shared/cubit/appcubit_state.dart';
import 'package:shopapp/shared/network/local/cahchhelper.dart';
import 'package:shopapp/shared/styles/themes.dart';
import 'shared/bloc_observer.dart';
import 'shared/network/remote/dio_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool isdark = CacheHelper.getData(key: 'isDark');
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') ?? false;
  Widget widget;
  token = CacheHelper.getData(key: 'token') ?? '';
  print(token);
  if (onBoarding != null) {
    if (token.isNotEmpty) {
      widget = ShopLayoutScreen();
    } else {
      widget = ShopLoginScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  //print(onBoarding);
  DioHelper.init();
  runApp(MyApp(
    startWidget: widget,
    isdark: isdark,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.startWidget, this.isdark})
      : super(
          key: key,
        );

  final Widget startWidget;
  bool? isdark;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AppCubit()..changeAppMode(fromShared: false)),
        // BlocProvider(
        //     create: (context) => ShopappCubit()
        //       ..getHomeData()
        //       ..getCategoriesData()
        //       ..getFavourites()
        //       ..getUserData()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darktheme,
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: startWidget);
        },
      ),
    );
  }
}
