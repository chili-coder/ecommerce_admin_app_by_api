import 'package:ecommerce_admin_app_by_api/http/custome_http_request.dart';
import 'package:ecommerce_admin_app_by_api/model/categorymodel.dart';
import 'package:ecommerce_admin_app_by_api/provider/catagoryprovider.dart';
import 'package:ecommerce_admin_app_by_api/screen/custome/add_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ecommerce_admin_app_by_api/screen/custome/update_category.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {


  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).getCategory();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final list = Provider.of<CategoryProvider>(context).categoryList;
    return Scaffold(

      body: GridView.builder(
         itemCount:list.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
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



                                  Stack(
                                 children: [
                                   Image.network( "https://apihomechef.antopolis.xyz/images/${list[index].image ?? ""}",
                                     width: double.infinity,height: 70,fit: BoxFit.cover,),

                                   Positioned(
                                     bottom: 5,
                                     left: 5,
                                     right: 5,
                                     child:  Center(

                                       child: Container(
                                         width: 40.0,
                                         height: 40.0,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(
                                             image: NetworkImage( "https://apihomechef.antopolis.xyz/images/${list[index].icon ?? ""}"),
                                             fit: BoxFit.cover,
                                           ),
                                           borderRadius: BorderRadius.all( Radius.circular(50.0)),
                                           border: Border.all(
                                             color: Colors.white,
                                             width: 2.0,
                                           ),
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],

                                  ),


                                  SizedBox(height: 5,),

                                  Text("${list[index].name}", maxLines: 2,  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,),),
                                  SizedBox(height: 3,),





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
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateCategory(
                                                          categoryModel:
                                                          list[index],
                                                        )));
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
                                                              .deleteCategory(list[index]
                                                              .id!
                                                              .toInt());

                                                          setState(() {
                                                            onProgress =
                                                            false;
                                                            list.removeAt(index);
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
          }),

      floatingActionButton: _buttonVisiable
          ? FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddCeragory()))
              .then((value) =>
              Provider.of<CategoryProvider>(context, listen: false));
        },
       // backgroundColor: aBlackCardColor,
        child: Icon(
          Icons.add,
          size: 30,

        ),
      )
          : null,
    );

  }
  bool onProgress = false;

  bool _buttonVisiable = true;
  ScrollController? _scrollController;
}
