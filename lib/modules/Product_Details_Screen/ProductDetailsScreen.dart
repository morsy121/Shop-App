import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/cubit/shopapp_cubit.dart';
import 'package:shopapp/models/product_details_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  PageController imageContriller = PageController();
  @override
  Widget build(BuildContext context) {
    //var productmodel = ShopappCubit.get(context).productDetailsModel!.data;
    return Scaffold(
      body: BuildProductDetails(),
    );
  }

  Widget BuildProductDetails() => SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image(image: AssetImage('assets/images/sale.jpg'))),
            SizedBox(
              height: 20,
            ),
            Text('Name'),
            SizedBox(
              height: 10,
            ),
            Text('Price'),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.red,
              width: double.infinity,
              height: 400,
              child: Text('description'),
            ),
          ],
        ),
      );
}
