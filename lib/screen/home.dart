import 'dart:convert';

import 'package:ecommerce_admin_app_by_api/http/custome_http_request.dart';
import 'package:ecommerce_admin_app_by_api/model/productmodel.dart';
import 'package:ecommerce_admin_app_by_api/provider/productprovider.dart';
import 'package:ecommerce_admin_app_by_api/screen/custome/add_product.dart';
import 'package:ecommerce_admin_app_by_api/widgets/load_screen.dart';
import 'package:ecommerce_admin_app_by_api/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // List<ProductModel>list=[];
  // late ProductModel procuctModel;
  // String product_api="https://apihomechef.antopolis.xyz/api/admin/products";
  // bool isLoading = false;
  //
  // fetchData() async{
  //   var responce= await http.get(Uri.parse(product_api),
  //       headers: await CustomHttpRequest().getHeaderWithToken()
  //   );
  //
  //   if(responce.statusCode==200){
  //     var data=jsonDecode(responce.body);
  //     for(var i in data){
  //       procuctModel=ProductModel.fromJson(i);
  //       setState(() {
  //         list.custome(procuctModel);
  //       });
  //
  //     }
  //   }
  //
  //
  // }
  Future loadData()async{

    setState(()=>isLoading=true);


   Provider.of<ProductProvider>(context, listen: false).getProduct();
   setState(()=>isLoading=false);
  }
  @override
  void initState(){
    loadData();
  // Provider.of<ProductProvider>(context, listen: false).getProduct();
    super.initState();
  }
  bool onProgress= false;
  bool isLoading =false;

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductProvider>(context).productList;
    return  SafeArea(
      child: Scaffold(
      body: GridView.builder(
          itemCount:productList.length ,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            if(isLoading){
              return LoadScreen();
            } else {
              return Card(
                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(

                    child:Column(
                      children: [
                        Expanded(child:  Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Container(

                                child: Column(
                                  children: [

                                    // Container(
                                    //   height: 60,
                                    //   width: 60,
                                    //   decoration: BoxDecoration(
                                    //     image: DecorationImage(
                                    //       image: NetworkImage(
                                    //           "https://apihomechef.antopolis.xyz/images/${list[index].image ?? ""}"),
                                    //     ),
                                    //   ),
                                    // ),
                                    Image.network( "https://apihomechef.antopolis.xyz/images/${productList[index].image??""}",
                                      width: double.infinity,height: 50,fit: BoxFit.cover,),

                                    // Image.network( "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/No_image_3x4.svg/1280px-No_image_3x4.svg.png",
                                    //   width: double.infinity,height: 50,fit: BoxFit.cover,),

                                    SizedBox(height: 5,),

                                    Text("${productList[index].name}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,),),
                                    SizedBox(height: 3,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Text("\$",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 12,),),

                                            Text("${productList[index].price![0].originalPrice}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,decoration: TextDecoration.lineThrough,fontSize: 12,),),
                                            SizedBox(width: 10,),
                                            Text("\$",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal),),
                                            Text("${productList[index].price![0].discountedPrice}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal,fontSize: 12,),),
                                          ],
                                        ),

                                        Text("${productList[index].price![0].discountType}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,),),
                                      ],
                                    ),
                                    SizedBox(height: 3,),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: [
                                            Text("Stoke:",style: TextStyle(fontSize: 12,),),
                                            SizedBox(width: 5,),
                                            Text("${productList[index].stockItems![0].quantity}",style: TextStyle(fontSize: 12,),),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.red,

                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(20))
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 16,right: 16),
                                            child: Row(
                                              children: [
                                                Text("${productList[index].price![0].percentOf}",style: TextStyle( color: Colors.teal,fontSize: 12,),),
                                                SizedBox(width: 5,),
                                                Text("%",style: TextStyle(color: Colors.teal,fontSize: 12,),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                width: 0.1),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                Radius.circular(5)),
                                          ),
                                          child: TextButton(
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.edit,
                                                  size:14,
                                                  color: Colors.teal,

                                                ),
                                                Text(
                                                  'Edit',
                                                  style: TextStyle(
                                                    color: Colors.teal,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onPressed: () {

                                            },
                                          ),
                                        )),
                                    Container(
                                      height: 30,
                                      width: 0.5,
                                      color: Colors.grey,
                                    ),
                                    Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.3),
                                                width: 0.1),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                Radius.circular(5)),
                                          ),
                                          child: TextButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Are you sure ?'),
                                                      titleTextStyle:
                                                      TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                          color: Colors.black
                                                      ),
                                                      titlePadding:
                                                      EdgeInsets.only(
                                                          left: 35,
                                                          top: 25),
                                                      content: Text(
                                                          'permanently delete!!'),
                                                      contentTextStyle:
                                                      TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight
                                                              .w400,
                                                          color: Colors.black87
                                                      ),
                                                      contentPadding:
                                                      EdgeInsets.only(
                                                          left: 35,
                                                          top: 10,
                                                          right: 40),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                15,
                                                                vertical:
                                                                10),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        5)),
                                                                border: Border.all(

                                                                    width:
                                                                    0.2)),
                                                            child: Text(
                                                              'CANCEL',
                                                              style: TextStyle(
                                                                fontSize:
                                                                12,
                                                                color: Colors.teal,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                        TextButton(
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                15,
                                                                vertical:
                                                                10),
                                                            decoration:
                                                            BoxDecoration(
                                                              color: Colors
                                                                  .redAccent
                                                                  .withOpacity(
                                                                  0.2),
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  5)),
                                                            ),
                                                            child: Text(
                                                              'Delete',
                                                              style: TextStyle(
                                                                fontSize:
                                                                12,
                                                                color: Colors.teal,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w500,
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed:
                                                              () async {
                                                            setState(() {
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 120,right: 120,top: 20),
                                                                child: LoadingIndicator(
                                                                  indicatorType: Indicator.ballTrianglePath,
                                                                  colors: const [Colors.teal],
                                                                  strokeWidth: 2,

                                                                ),
                                                              );

                                                            });

                                                            await CustomHttpRequest
                                                                .deleteCategory(productList[index]
                                                                .id!
                                                                .toInt());

                                                            setState(() {
                                                              onProgress =
                                                              false;
                                                              productList.removeAt(index);
                                                            });


                                                            Navigator.pop(
                                                                context);


                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  });
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.delete,
                                                  size: 14,
                                                  color: Colors.red,
                                                ),
                                                Text(
                                                  'Delete',
                                                  style: TextStyle(

                                                      color: Colors.red),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                ),
              );
            }

          }),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
          Icons.add,
          size: 30,
        ),
          backgroundColor: Colors.teal,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddProduct())
            );
          },
        ),
      ),
    );
  }
}
