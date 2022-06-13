
import 'package:ecommerce_admin_app_by_api/provider/orderprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}



class _OrderPageState extends State<OrderPage> {

  @override
  void initState(){
   Provider.of<OrderProvider>(context, listen: false).getOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   final list = Provider.of<OrderProvider>(context).orderList;
    return Scaffold(
      body: ListView.builder(
          itemCount:list.length ,
          shrinkWrap: true,
          itemBuilder: (context,index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(flex: 5,child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(

                              children: [
                                Text("#",style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("${list[index].id}",style: TextStyle(fontWeight: FontWeight.bold),),

                              ],),
                            Row(children: [
                              Text("Product: "),
                              Text("${list[index].orderStatus!.orderStatusCategory!.name}"),

                            ],),
                            Row(children: [
                              Text("\$",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold)),
                              Text("${list[index].price}",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),),

                            ],),


                          ],
                        )),
                        Expanded(flex: 3,child: Column(

                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Payment Status: "),
                                Text("${list[index].payment!.paymentStatus}"),

                              ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("User: "),
                                Text("Admin"),

                              ],),
                          ],
                        )),
                      ],
                    ),
                  ),
                ),

              ],

            );
          }),
    );
  }
}
