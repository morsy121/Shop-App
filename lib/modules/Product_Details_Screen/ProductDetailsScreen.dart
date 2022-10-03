import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read_more_text/read_more_text.dart';
import 'package:shopapp/Layout/cubit/shopapp_cubit.dart';
import 'package:shopapp/models/product_details_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, this.id});
  PageController imageController = PageController();
  int? id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopappCubit()..getProductDetails(id!),
      child: BlocConsumer<ShopappCubit, ShopappState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! ShopeLoadingGetProductDetailsState,
              builder: (context) => BuildProductDetails(
                  ShopappCubit.get(context).productDetailsModel!, context),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  height: 300,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: imageController,
                    itemBuilder: (context, index) => CachedNetworkImage(
                      imageUrl: model.data!.images![index],
                    ),
                    itemCount: model.data!.images!.length,
                  )),
            ),
            SmoothPageIndicator(
              controller: imageController,
              count: model.data!.images!.length,
              effect: WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.blue,
                  dotWidth: 10,
                  dotHeight: 10,
                  spacing: 7),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                model.data!.name!,
                style: TextStyle(
                  fontSize: 20.0,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    '${model.data!.price.round()}',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  if (model.data!.discount != 0)
                    Text(
                      '${model.data!.oldPrice}',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 7,
                          decoration: TextDecoration.lineThrough),
                    ),
                  SizedBox(
                    width: 6,
                  ),
                  if (model.data!.discount != 0)
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        '${model.data!.discount}% Off',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black54,
                      Colors.blue[700]!,
                      Colors.redAccent,
                    ]),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    model.data!.description!,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  )
                  // ReadMoreText(
                  //   model.data!.description!,
                  //   readMoreText: 'read more',
                  //   readLessText: 'read less',
                  //   numLines: 8,
                  //   readMoreIconColor: Color.fromARGB(255, 118, 14, 7),
                  //   readMoreTextStyle: TextStyle(
                  //       fontSize: 18, color: Color.fromARGB(255, 118, 14, 7)),
                  //   style: TextStyle(
                  //     fontSize: 17,
                  //     color: Colors.white,
                  //     height: 1.5,
                  //   ),
                  // ),
                  ),
            )
          ],
        ),
      );
}
