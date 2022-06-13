import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
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
                          Image.network("https://cdn.luxe.digital/media/2020/05/21140728/best-luxury-watch-brands-hublot-luxe-digital.jpg",
                            width: double.infinity,height: 60,fit: BoxFit.cover,),
                          SizedBox(height: 5,),
                          Text("Name of product",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 5,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text("\$",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),

                                  Text("300",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,decoration: TextDecoration.lineThrough),),
                                  SizedBox(width: 10,),
                                  Text("\$",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal),),
                                  Text("200",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal,),),
                                ],
                              ),

                              Text("Fixed",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300,),),
                            ],
                          ),

                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text("Stoke:",style: TextStyle(fontSize: 10,),),
                                  SizedBox(width: 5,),
                                  Text("300",style: TextStyle(fontSize: 10,),),
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
                                      Text("18",style: TextStyle( color: Colors.teal),),
                                      SizedBox(width: 5,),
                                      Text("%",style: TextStyle(color: Colors.teal,),),
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
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

                                                  });


                                                  Navigator.pop(
                                                      context);


                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
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
        )
      ),
    );
  }
}
