import 'package:ecommerce_admin_app_by_api/screen/category.dart';
import 'package:ecommerce_admin_app_by_api/screen/home.dart';
import 'package:ecommerce_admin_app_by_api/screen/order.dart';
import 'package:ecommerce_admin_app_by_api/screen/profile.dart';
import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int currentIndex = 0;

  List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    OrderPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("e-commercs",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.w300),),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
        ),
        actions: [
          Icon(
            Icons.person,
            color: Colors.black87,
          ),
          SizedBox(
            width: 12,
          )
        ],
      ),

      body: Container(
        child:  pages[currentIndex]
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        elevation: 5,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.blueGrey,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Category",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_rounded),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),


    );
  }
}











