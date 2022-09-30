import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp/shared/styles/colors.dart';

ThemeData darktheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: const Color(0xff333739),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Color(0xff333739),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Color(0xff333739),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Color(0xff333739),
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  fontFamily: 'OpenSans',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily: 'OpenSans',
);


// textTheme: TextTheme(
//     bodyText2: TextStyle(
//       color: Colors.white,
//       fontSize: 16.0,
//       fontWeight: FontWeight.w500,
//     ),



// theme: ThemeData(
//               primarySwatch:Colors.deepOrange,
//               scaffoldBackgroundColor:Colors.white,
//               appBarTheme: AppBarTheme(
//                 titleSpacing: 20.0,
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                   statusBarColor: Colors.white,
//                   statusBarIconBrightness:Brightness.dark,
//                 ),
//                 backgroundColor: Colors.white,
//                 elevation: 0.0,
//                 titleTextStyle: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 iconTheme: IconThemeData(
//                   color: Colors.black,
//                 ),
//               ),
//               bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                 type: BottomNavigationBarType.fixed,
//                 selectedItemColor: Colors.deepOrange,
//                 unselectedItemColor:Colors.grey,
//                 elevation: 20.0,
//                 backgroundColor: Colors.white,
//               ),
//               textTheme: TextTheme(
//                 bodyText1: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black,
//                 ),
//               ),
//               floatingActionButtonTheme: FloatingActionButtonThemeData(
//                 backgroundColor: Colors.deepOrange,
//               ),
//             ),




// darkTheme: ThemeData(
//               primarySwatch:Colors.deepOrange,
//               scaffoldBackgroundColor: HexColor('333739'),
//               appBarTheme: AppBarTheme(
//                 titleSpacing: 20.0,
//                 systemOverlayStyle: SystemUiOverlayStyle(
//                   statusBarColor:HexColor('333739'),
//                   statusBarIconBrightness:Brightness.light,
//                 ),
//                 backgroundColor:HexColor('333739'),
//                 elevation: 0.0,
//                 titleTextStyle: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 iconTheme: IconThemeData(
//                   color: Colors.white,
//                 ),
//               ),
//               bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                 type: BottomNavigationBarType.fixed,
//                 selectedItemColor: Colors.deepOrange,
//                 unselectedItemColor:Colors.grey,
//                 elevation: 20.0,
//                 backgroundColor: HexColor('333739'),
//               ),
//               floatingActionButtonTheme: FloatingActionButtonThemeData(
//                 backgroundColor: Colors.deepOrange,
//               ),
//               textTheme: TextTheme(
//                 bodyText1: TextStyle(
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//             ),