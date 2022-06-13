import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class LoadScreen extends StatefulWidget {
  const LoadScreen({Key? key}) : super(key: key);

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount:16 ,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context,index){
            return   ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: [
                SizedBox(height: 50,),

                Expanded(child: Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.25),
                  highlightColor: Colors.white.withOpacity(0.5),
                  period: const Duration(seconds: 2),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.9),
                    ),

                  ),
                ),
                ),
                Column(
                  children: [

                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.25),
                          highlightColor: Colors.white.withOpacity(0.5),
                          period: const Duration(seconds: 2),
                          child: Container(
                            height: 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.9),
                            ),

                          ),
                        ),),
                        SizedBox(width: 10,),
                        Expanded(child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.25),
                          highlightColor: Colors.white.withOpacity(0.5),
                          period: const Duration(seconds: 2),
                          child: Container(
                            height: 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.9),
                            ),

                          ),
                        ),),
                        SizedBox(width: 10,),
                        Expanded(child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.25),
                          highlightColor: Colors.white.withOpacity(0.5),
                          period: const Duration(seconds: 2),
                          child: Container(
                            height: 20,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.9),
                            ),

                          ),
                        ),),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.25),
                          highlightColor: Colors.white.withOpacity(0.5),
                          period: const Duration(seconds: 2),
                          child: Container(
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.9),
                            ),

                          ),
                        ),),
                        SizedBox(width: 10,),
                        Expanded(child: Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.25),
                          highlightColor: Colors.white.withOpacity(0.5),
                          period: const Duration(seconds: 2),
                          child: Container(
                            height: 30,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey.withOpacity(0.9),
                            ),

                          ),
                        ),),
                      ],
                    ),
                  ],
                ),


              ],
            );

          }
      ),
    );


  }
}

