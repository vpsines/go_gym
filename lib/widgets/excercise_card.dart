import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_gym/constants/app_colors.dart';

class ExcerciseCard extends StatelessWidget {
  const ExcerciseCard({super.key, required this.excercise, required this.onTap});
  final Map<String, dynamic> excercise;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: 
       onTap,
      child: Container(
        height: 135,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(excercise["thumbnail"]),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      excercise["title"],
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.homePageTitle,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        excercise["time"],
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                      color: const Color(0xFFEAEEFC),
                      borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                        child:  Text(
                          "15s rest",
                          style: TextStyle(
                            color: Color(0xFF839FED)
                          ),
                        ),
                      ),
                ),
                Row(
                  children: [
                    for(int i=0;i<70;i++)
                    Container(
                      width: 3,
                      height: 1,
                      decoration: BoxDecoration(
                        color: i%2 ==0 ?const Color(0xFF839FED):Colors.white,
                        borderRadius: BorderRadius.circular(2)
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
