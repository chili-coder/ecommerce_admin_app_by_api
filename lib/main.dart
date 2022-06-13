import 'package:ecommerce_admin_app_by_api/provider/catagoryprovider.dart';
import 'package:ecommerce_admin_app_by_api/provider/orderprovider.dart';
import 'package:ecommerce_admin_app_by_api/provider/productprovider.dart';
import 'package:ecommerce_admin_app_by_api/screen/bottom_nav.dart';
import 'package:ecommerce_admin_app_by_api/screen/custome/add_product.dart';
import 'package:ecommerce_admin_app_by_api/screen/home.dart';
import 'package:ecommerce_admin_app_by_api/screen/login.dart';
import 'package:ecommerce_admin_app_by_api/screen/splash.dart';
import 'package:ecommerce_admin_app_by_api/widgets/load_screen.dart';
import 'package:ecommerce_admin_app_by_api/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(create: (_)=>ProductProvider()),
        ChangeNotifierProvider<CategoryProvider>(create: (_) => CategoryProvider()),
        ChangeNotifierProvider<OrderProvider>(create: (_) => OrderProvider()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: SplashPage(),
    );
  }
}

