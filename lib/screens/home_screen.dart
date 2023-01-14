import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_gym/constants/app_colors.dart';
import 'package:go_gym/screens/excercise_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List info = [];

  initData(){
      DefaultAssetBundle.of(context).loadString("assets/json/info.json").then((value){
        setState(() {
          info =json.decode(value);
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
      backgroundColor: AppColors.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColors.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
                const Expanded(child: SizedBox()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today_outlined,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: AppColors.homePageIcons,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColors.homePageSubtitle,
                      fontWeight: FontWeight.w700),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.homePageDetail,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: (){
                    Get.to(() =>const ExcerciseScreen());
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: AppColors.homePageIcons,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(80),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  gradient: LinearGradient(colors: [
                    AppColors.gradientFirst.withOpacity(0.8),
                    AppColors.gradientSecond.withOpacity(0.9)
                  ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(5, 10),
                        blurRadius: 20,
                        color: AppColors.gradientSecond.withOpacity(0.2))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Next Workout",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Legs Toning",
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "and Glutes Workout",
                      style: TextStyle(
                        fontSize: 25,
                        color: AppColors.homePageContainerTextSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: AppColors.homePageContainerTextSmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "60 min",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.homePageContainerTextSmall,
                              ),
                            ),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: AppColors.gradientFirst,
                                blurRadius: 10,
                                offset: const Offset(4, 8))
                          ], borderRadius: BorderRadius.circular(60)),
                          child: const Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: Colors.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/card.jpg"),
                            fit: BoxFit.fill),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 40,
                              offset: const Offset(8, 10),
                              color: AppColors.gradientSecond.withOpacity(0.3)),
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(-1, -5),
                              color: AppColors.gradientSecond.withOpacity(0.3)),
                        ]),
                  ),
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                        right: 200,
                        bottom: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/figure.png"),
                        ),
                      )),
                  Container(
                    width: double.maxFinite,
                    height: 100,
                    margin: const EdgeInsets.only(
                      left: 125,
                      top: 50,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "You are doing great",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.homePageDetail),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text: "Keep it up\n",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.homePagePlanColor,
                                ),
                                children: const [
                              TextSpan(text: "stick to your plan")
                            ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Area of focus",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: AppColors.homePageTitle),
                ),
              ],
            ),
            Expanded(child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio:1.5
                ),
                shrinkWrap: true,
                itemCount: info.length,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                itemBuilder: (context, index) {
            
                return Container(
                  width: (MediaQuery.of(context).size.width - 90) /2,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image:  DecorationImage(
                          image: AssetImage(info[index]["img"])),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3,
                            offset: const Offset(5, 5),
                            color: AppColors.gradientSecond.withOpacity(0.1)),
                        BoxShadow(
                            blurRadius: 3,
                            offset: const Offset(-5, -5),
                            color: AppColors.gradientSecond.withOpacity(0.1))
                      ]),
                      child: Center
                    (
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(info[index]["title"],
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.homePageDetail,
                          
                        ),),
                      )
                    ),
                );
              }),
            ))
          ],
        ),
      ),
    );
  }
}
