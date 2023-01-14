import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_gym/constants/app_colors.dart';

class ExcerciseScreen extends StatefulWidget {
  const ExcerciseScreen({super.key});

  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {

    List excercises = [];

  initData(){
      DefaultAssetBundle.of(context).loadString("assets/json/videoinfo.json").then((value){
        setState(() {
          excercises =json.decode(value);
        });
      });
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.gradientFirst.withOpacity(0.9),
            AppColors.gradientSecond
          ], begin: const FractionalOffset(0, 0.4), end: Alignment.topRight),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, right: 30, left: 30),
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: AppColors.secondPageIconColor,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Icon(
                        Icons.info_outline,
                        size: 20,
                        color: AppColors.secondPageIconColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Legs Toning",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.secondPageTitleColor,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "and Glutes Workout",
                    style: TextStyle(
                      fontSize: 25,
                      color: AppColors.secondPageTitleColor,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.secondPageContainerGradient1stColor,
                                AppColors.secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColors.secondPageIconColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "68 min",
                              style: TextStyle(
                                color: AppColors.secondPageIconColor,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 200,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.secondPageContainerGradient1stColor,
                                AppColors.secondPageContainerGradient2ndColor
                              ],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.handyman_outlined,
                              size: 20,
                              color: AppColors.secondPageIconColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Resistent band",
                              style: TextStyle(
                                color: AppColors.secondPageIconColor,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                                        const SizedBox(width: 30,),

                      Text(
                        "Circuit 1: Legs Toning",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.circuitsColor,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Row(
                        children: [
                          Icon(Icons.loop,size: 30,color: AppColors.loopColor),
                          const SizedBox(width: 10,),
                          Text("3 sets",
                          style:TextStyle(
                            fontSize: 15,
                            color: AppColors.setsColor
                          ),)
                        ],
                      ),
                      const SizedBox(width: 30,)
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
