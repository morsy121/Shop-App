import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Layout/cubit/shopapp_cubit.dart';
import 'package:shopapp/models/Favourites_model.dart';
import 'package:shopapp/modules/search/cubit/cubit.dart';
import 'package:shopapp/modules/search/cubit/states.dart';
import 'package:shopapp/shared/components/components.dart';
import 'package:shopapp/shared/styles/colors.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var serrchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                child: Column(
                  children: [
                    defaultFormField(
                        controller: serrchController,
                        type: TextInputType.text,
                        vaildate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Enter Text To Search';
                          } else {
                            return null;
                          }
                        },
                        lable: 'Search',
                        prefix: Icons.search,
                        onSubmit: (String? text) {
                          SearchCubit.get(context).search(text!);
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    if (state is SearchLoadingState) LinearProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    if (state is SearchSuccessState)
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => BlocProvider(
                                  create: (context) => ShopappCubit(),
                                  child:
                                      BlocConsumer<ShopappCubit, ShopappState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      return buildItemFavourites(
                                          SearchCubit.get(context)
                                              .model!
                                              .data!
                                              .data![index],
                                          context,
                                          isOldPrice: false);
                                    },
                                  ),
                                ),
                            separatorBuilder: (context, index) => Divider(
                                  height: 2,
                                ),
                            itemCount: SearchCubit.get(context)
                                .model!
                                .data!
                                .data!
                                .length),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildItemFavourites(model, context, {bool isOldPrice = true}) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage('${model!.image!}'),
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                  if (model.discount != 0 && isOldPrice)
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
                      '${model.name!}',
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
                          '${model.price!.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: defaultColor),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (model.discount != 0 && isOldPrice)
                          Text(
                            '${model.oldPrice!.toString()}',
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
                                  .changeFavourites(model.id!);
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              // backgroundColor: ShopappCubit.get(context)
                              //         .favourites[model!.id]!
                              //     ? defaultColor
                              //     : Colors.grey,

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
