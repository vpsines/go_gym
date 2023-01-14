import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_gym/constants/app_colors.dart';
import 'package:go_gym/widgets/excercise_card.dart';
import 'package:go_gym/widgets/video_player.dart';
import 'package:video_player/video_player.dart';

class ExcerciseScreen extends StatefulWidget {
  const ExcerciseScreen({super.key});

  @override
  State<ExcerciseScreen> createState() => _ExcerciseScreenState();
}

class _ExcerciseScreenState extends State<ExcerciseScreen> {
  List excercises = [];
  bool playArea = false;
  bool isPlaying = false;
  bool isDisposed = false;
  VideoPlayerController? controller;
  int isPlayingIndex = -1;

  initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("assets/json/videoinfo.json")
        .then((value) {
      setState(() {
        excercises = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  void dispose() {
    isDisposed = true;
    controller?.pause();
    controller?.dispose();
    controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: (!playArea)
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      AppColors.gradientFirst.withOpacity(0.9),
                      AppColors.gradientSecond
                    ],
                    begin: const FractionalOffset(0, 0.4),
                    end: Alignment.topRight),
              )
            : BoxDecoration(color: AppColors.gradientSecond),
        child: Column(
          children: [
            (!playArea)
                ? Container(
                    padding:
                        const EdgeInsets.only(top: 70, right: 30, left: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
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
                                      AppColors
                                          .secondPageContainerGradient1stColor,
                                      AppColors
                                          .secondPageContainerGradient2ndColor
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
                                      AppColors
                                          .secondPageContainerGradient1stColor,
                                      AppColors
                                          .secondPageContainerGradient2ndColor
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
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding: const EdgeInsets.only(
                              top: 50, left: 30, right: 30),
                          child: Row(
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: AppColors.secondPageTopIconColor,
                                ),
                                onTap: () {
                                  Get.back();
                                },
                              ),
                              const Expanded(child: SizedBox()),
                              Icon(
                                Icons.info_outline,
                                size: 20,
                                color: AppColors.secondPageTopIconColor,
                              )
                            ],
                          ),
                        ),
                        VideoPlayerWidget(
                          controller: controller,
                          isPlaying: isPlaying,
                          onPlayStatusChanged: (val) {
                            setState(() {
                              isPlaying = val;
                            });
                          },
                          onRewinfOrForwardPressed: (value) {
                            if (value > excercises.length - 1) {
                              Get.snackbar("Video", "",
                                  snackPosition: SnackPosition.BOTTOM,
                                  icon: const Icon(
                                    Icons.face,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  backgroundColor: AppColors.gradientSecond,
                                  colorText: Colors.white,
                                  messageText: const Text(
                                    "You have reached the end of the playlist",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ));
                            } else {
                              onTapPlayVideo(value);
                            }
                          },
                          playingIndex: isPlayingIndex,
                        )
                      ],
                    ),
                  ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(70))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
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
                          Icon(Icons.loop,
                              size: 30, color: AppColors.loopColor),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "3 sets",
                            style: TextStyle(
                                fontSize: 15, color: AppColors.setsColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          itemCount: excercises.length,
                          itemBuilder: (_, int index) {
                            return ExcerciseCard(
                              excercise: excercises[index],
                              onTap: () {
                                setState(() {
                                  if (!playArea) {
                                    playArea = true;
                                    onTapPlayVideo(index);
                                  }
                                });
                              },
                            );
                          }))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  onTapPlayVideo(int index) {
    final old = controller;
    controller = VideoPlayerController.network(excercises[index]["videoUrl"]);
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    // ignore: avoid_single_cascade_in_expression_statements
    controller!
      ..initialize().then((value) => (_) {
            old?.dispose();
            isPlayingIndex = index;
            controller!.addListener(_onControllerUpdate);
            controller!.play();
            setState(() {});
          });
  }

  var _onUpdateControllerTime = 0;

  void _onControllerUpdate() async {
    if (isDisposed) {
      return;
    }

    _onUpdateControllerTime = 0;
    Duration? _duration;
    Duration _position;
    var _progress = 0.0;

    final now = DateTime.now().microsecondsSinceEpoch;

    if (_onUpdateControllerTime > now) {
      return;
    }

    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller!.value.isInitialized) {
      debugPrint("cantroller cannot be initialized");
      return;
    }
    final playing = controller!.value.isPlaying;
    isPlaying = playing;
  }
}
