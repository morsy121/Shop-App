import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopapp/shared/styles/colors.dart';

import '../../Layout/cubit/shopapp_cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color? background,
  bool isUppercase = true,
  double raduis = 10,
  @required Function()? function,
  @required String? text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: function,
        height: 50.0,
        color: background,
        child: Text(
          isUppercase ? text!.toUpperCase() : text!,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );

Widget defaultTextButton(
        {@required String? text, @required Function()? function}) =>
    TextButton(
      onPressed: function,
      child: Text(text!.toUpperCase()),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false,
    );

Widget defaultFormField({
  @required TextEditingController? controller,
  @required TextInputType? type,
  Function(String?)? onSubmit,
  Function(String?)? onChange,
  VoidCallback? onTap,
  bool isPassword = false,
  String? Function(String?)? vaildate,
  @required String? lable,
  @required IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressd,
}) =>
    TextFormField(
      style: TextStyle(
        color: Colors.black54,
      ),
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: vaildate,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressd,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

void showToast({required String message, required ToastState state}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: choseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

enum ToastState { success, error, warning }

Color choseToastColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.success:
      color = Colors.green;
      break;

    case ToastState.error:
      color = Colors.red;
      break;

    case ToastState.warning:
      color = Colors.yellow;
      break;
  }

  return color;
}

// Widget buildItemFavourites(model, context, {bool isOldPrice = true}) => Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: Container(
//         height: 120.0,
//         child: Row(
//           children: [
//             Stack(
//               alignment: AlignmentDirectional.bottomStart,
//               children: [
//                 Image(
//                   image: NetworkImage('${model!.image!}'),
//                   width: 120.0,
//                   height: 120.0,
//                   fit: BoxFit.cover,
//                 ),
//                 if (model.discount! != 0 && isOldPrice)
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 5),
//                     color: Colors.red,
//                     child: Text(
//                       'Discount',
//                       style: TextStyle(fontSize: 15, color: Colors.white),
//                     ),
//                   ),
//               ],
//             ),
//             SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${model.name!}',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 15, height: 1.3),
//                   ),
//                   Spacer(),
//                   Row(
//                     children: [
//                       Text(
//                         '${model.price!.toString()}',
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 13,
//                             color: defaultColor),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       if (model.discount != 0 && isOldPrice)
//                         Text(
//                           '${model.oldPrice!.toString()}',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 10,
//                               color: Colors.grey,
//                               decoration: TextDecoration.lineThrough),
//                         ),
//                       Spacer(),
//                       IconButton(
//                           onPressed: () {
//                             ShopappCubit.get(context)
//                                 .changeFavourites(model.id!);
//                           },
//                           icon: CircleAvatar(
//                             radius: 15.0,
//                             backgroundColor:
//                                 ShopappCubit.get(context).favourites[model.id]!
//                                     ? defaultColor
//                                     : Colors.grey,
//                             child: Icon(
//                               Icons.favorite_border,
//                               size: 20,
//                               color: Colors.white,
//                             ),
//                           ))
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
