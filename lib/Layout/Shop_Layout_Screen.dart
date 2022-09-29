import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/cubit/shopapp_cubit.dart';
import 'package:shopapp/models/product_details_screen.dart';
import 'package:shopapp/modules/LoginScreen/shopLoginScreen.dart';
import 'package:shopapp/modules/search/search_screen.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/network/local/cahchhelper.dart';

class ShopLayoutScreen extends StatelessWidget {
  const ShopLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopappCubit()
        ..getUserData()
        ..getCategoriesData()
        ..getFavourites()
        ..getHomeData(),
      child: BlocConsumer<ShopappCubit, ShopappState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShopappCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('Salla'),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search))
              ],
            ),
            body: cubit.bottomscreen[cubit.curreentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.changeBottom(index);
              },
              currentIndex: cubit.curreentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: (Icon(Icons.home)), label: 'Home'),
                BottomNavigationBarItem(
                    icon: (Icon(Icons.apps)), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: (Icon(Icons.favorite)), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: (Icon(Icons.settings)), label: 'Settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}
