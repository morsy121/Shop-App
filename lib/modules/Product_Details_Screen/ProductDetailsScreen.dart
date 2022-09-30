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
    return BlocProvider(
      create: (context) => ShopappCubit(),
      child: Scaffold(
        body: BlocConsumer<ShopappCubit, ShopappState>(
          listener: (context, state) {},
          builder: (context, state) {
            return BuildProductDetails(
                ShopappCubit.get(context).productDetailsModel!, context);
          },
        ),
      ),
    );
  }

  Widget BuildProductDetails(
    ProductDetailsModel model,
    context,
  ) =>
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image(
                  image: NetworkImage('${model.data!.image!}'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                )),
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
