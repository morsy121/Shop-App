import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/cubit/shopapp_cubit.dart';
import 'package:shopapp/models/Favourites_model.dart';
import 'package:shopapp/shared/styles/colors.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopappCubit, ShopappState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildItemFavourites(
                ShopappCubit.get(context).favouritesModel!.data!.data![index],
                context),
            separatorBuilder: (context, index) => Divider(
                  height: 2,
                ),
            itemCount:
                ShopappCubit.get(context).favouritesModel!.data!.data!.length);

        // return ConditionalBuilder(
        //   condition: state is ShopeLoadingGetFavouritesState,
        //   builder: (context) => ListView.separated(
        //       physics: BouncingScrollPhysics(),
        //       itemBuilder: (context, index) => buildItemFavourites(
        //           ShopappCubit.get(context).favouritesModel!.data!.data![index],
        //           context),
        //       separatorBuilder: (context, index) => Divider(
        //             height: 2,
        //           ),
        //       itemCount: ShopappCubit.get(context)
        //           .favouritesModel!
        //           .data!
        //           .data!
        //           .length),
        //   fallback: (context) => Center(child: CircularProgressIndicator()),
        // );
      },
    );
  }

  Widget buildItemFavourites(FavouritesData? model, context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage('${model!.product!.image!}'),
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                  if (model.product!.discount != 0)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child: Text(
                        'Discount',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.product!.name!}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          height: 1.3),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.product!.price!.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: defaultColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (model.product!.discount! != 0)
                          Text(
                            '${model.product!.oldPrice!.toString()}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              ShopappCubit.get(context)
                                  .changeFavourites(model.product!.id!);
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: ShopappCubit.get(context)
                                      .favourites[model.product!.id]!
                                  ? defaultColor
                                  : Colors.grey,
                              child: Icon(
                                Icons.favorite_border,
                                size: 20,
                                color: Colors.white,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
