import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_gym/constants/app_colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoPlayerController? controller;
  final bool isPlaying;
  final ValueChanged<bool> onPlayStatusChanged;
  final int playingIndex;
  final ValueChanged<int> onRewinfOrForwardPressed;

  const VideoPlayerWidget(
      {super.key,
      required this.controller,
      required this.isPlaying,
      required this.onPlayStatusChanged,
      required this.playingIndex,
      required this.onRewinfOrForwardPressed});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  bool noMute = false;
  // final duration = _duration?.inSeconds ?? 0;
  // final head = _position?.inSeconds ??0;
  // final remained = max(0,duration-head);
  // final mins = convertTwo(remained ~/ 60.0);
  // final secs = convertTwo(remained%60);

  @override
  void initState() {
    noMute = (widget.controller?.value.volume ?? 0) > 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.controller != null && widget.controller!.value.isInitialized)
        ? Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VideoPlayer(widget.controller!),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.red[700],
                    inactiveTrackColor: Colors.red[100],
                    trackShape: const RoundedRectSliderTrackShape(),
                    trackHeight: 2.0,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: Colors.redAccent,
                    overlayColor: Colors.red.withAlpha(32),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 28),
                    tickMarkShape: const RoundSliderTickMarkShape(),
                    activeTickMarkColor: Colors.red[700],
                    inactiveTickMarkColor: Colors.red[700],
                    valueIndicatorShape:
                        const PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: Colors.redAccent,
                    valueIndicatorTextStyle: const TextStyle(
                      color: Colors.white,
                    )),
                child: Slider(
                  value: max(0, 30),
                  max: 100,
                  min: 0,
                  divisions: 100,
                  label: const Duration(minutes: 1).toString().split('.')[0],
                  onChanged: (value) {
                    setState(() {
                      // _progress = value * 0.01;
                    });
                  },
                  onChangeStart: (value) {
                    widget.controller?.pause();
                  },
                  onChangeEnd: (value) {
                    final duration = widget.controller?.value.duration;
                    if (duration != null) {
                      var newValue = max(0, min(value, 99)) * 0.01;
                      var millis = (duration.inMilliseconds * newValue).toInt();
                      widget.controller?.seekTo(Duration(milliseconds: millis));
                      widget.controller?.play();
                    }
                  },
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(bottom: 5),
                width: MediaQuery.of(context).size.width,
                color: AppColors.gradientSecond,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 4,
                                    color: Color.fromARGB(50, 0, 0, 0))
                              ]),
                          child: Icon(
                            noMute ? Icons.volume_up : Icons.volume_off,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        noMute = (widget.controller?.value.volume ?? 0) > 0;
                        if (noMute) {
                          widget.controller?.setVolume(0);
                        } else {
                          widget.controller?.setVolume(1);
                        }
                        setState(() {});
                      },
                    ),
                    TextButton(
                        onPressed: () async {
                          final index = widget.playingIndex - 1;
                          if (index >= 0) {
                            widget.onRewinfOrForwardPressed(index);
                          } else {
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
                                  "You have reached last excercise. Congrats",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ));
                          }
                        },
                        child: const Icon(
                          Icons.fast_rewind,
                          size: 36,
                          color: Colors.white,
                        )),
                    TextButton(
                        onPressed: () async {
                          if (widget.isPlaying) {
                            widget.controller?.pause();
                            widget.onPlayStatusChanged(false);
                          } else {
                            widget.onPlayStatusChanged(true);
                            widget.controller?.play();
                          }
                        },
                        child: Icon(
                          widget.isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 36,
                          color: Colors.white,
                        )),
                    TextButton(
                        onPressed: () async {
                          final index = widget.playingIndex + 1;
                          widget.onRewinfOrForwardPressed(index);
                        },
                        child: const Icon(
                          Icons.fast_forward,
                          size: 36,
                          color: Colors.white,
                        )),
                    const Text(
                      "00:00",
                      style: TextStyle(color: Colors.white, shadows: [
                        Shadow(
                            offset: Offset(0, 1),
                            blurRadius: 4,
                            color: Color.fromARGB(150, 0, 0, 0))
                      ]),
                    )
                  ],
                ),
              )
            ],
          )
        : const AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(
                child: Text(
              "Preparing",
              style: TextStyle(color: Colors.white60, fontSize: 20),
            )));
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }
}
