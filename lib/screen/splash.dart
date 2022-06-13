import 'dart:async';

import 'package:ecommerce_admin_app_by_api/screen/home.dart';
import 'package:ecommerce_admin_app_by_api/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png",width: 120,height: 120,),
              SizedBox(height: 10,),
              Text("e-commerce",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("Admin",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),),
              Padding(
                padding: const EdgeInsets.only(left: 120,right: 120,top: 20),
                child: LoadingIndicator(

                    indicatorType: Indicator.ballTrianglePath,
                    colors: const [Colors.teal],
                    strokeWidth: 2,

                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
