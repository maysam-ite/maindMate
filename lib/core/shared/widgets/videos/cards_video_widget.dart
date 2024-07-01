import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:maindmate/core/shared/animation/shimmer_animation.dart';
import 'package:video_player/video_player.dart';

// Define the type for the sound control callback function.
typedef SoundControlCallback = bool Function();

// ignore: must_be_immutable
class CardsVideoWidget extends StatefulWidget {
  CardsVideoWidget(
      {super.key,
      required this.currentVideoUrl,
      this.autoPlay = false,
      required this.videoHgiht,
      required this.videoWidth}) {}
  final String currentVideoUrl;
  final double videoHgiht;
  final double videoWidth;
  bool autoPlay = false;
  @override
  State<CardsVideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<CardsVideoWidget>
    with WidgetsBindingObserver {
  bool videoInitialized = false;
  bool hasError = false;
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initializeController();
  }

  @override
  void didUpdateWidget(covariant CardsVideoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentVideoUrl != videoPlayerController.dataSource) {
      // Update the video player if the video URL has changed
      // videoPlayerController.pause();
      videoPlayerController.dispose();
      initializeController();
      setState(() {});
    }
  }

  initializeController() async {
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.currentVideoUrl))
          ..initialize().then((_) {
            setState(() {
              videoPlayerController.setLooping(false); // Enable looping
              videoPlayerController
                  .setVolume(widget.autoPlay ? 1 : 0); // Mute the video
              widget.autoPlay
                  ? videoPlayerController.play()
                  : videoPlayerController.pause(); // Auto-play the video
              videoInitialized = true;
            });
          }).catchError((error) {
            // Handle the error here
            setState(() {
              hasError = true;
            });
            return;
          });
    videoPlayerController.addListener(() {
      if (videoPlayerController.value.isPlaying && !_isPlaying) {
        // Video has started playing
        setState(() {
          _isPlaying = false;
        });
      }
    });
    // }
  }

  @override
  void dispose() {
    log('disposing a controller');
    if (mounted) {
      videoPlayerController.dispose();
    } // Dispose of the controller when done
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  bool _isPlaying = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // App is in the foreground
      videoPlayerController.setVolume(0);
      videoPlayerController.pause();
    } else if (state == AppLifecycleState.inactive) {
      // App is partially obscured
      videoPlayerController.pause();
    } else if (state == AppLifecycleState.paused) {
      // App is in the background
      videoPlayerController.pause();
    } else if (state == AppLifecycleState.detached) {
      // App is terminated
      videoPlayerController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return SizedBox(
        height: widget.videoHgiht,
        width: widget.videoWidth,
        child: Center(
          child: Text(
            'Error loading video',
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }

    return SizedBox(
      height: widget.videoHgiht,
      width: widget.videoWidth,
      child: videoInitialized
          ? GestureDetector(
              onTap: () {
                setState(() {
                  if (videoPlayerController.value.isPlaying) {
                    videoPlayerController.pause();
                    _isPlaying = false;
                  } else {
                    videoPlayerController.play();
                    _isPlaying = true;
                  }
                });
              },
              child: FittedBox(
                fit: BoxFit.contain,
                child: SizedBox(
                  height: videoPlayerController.value.size.height,
                  width: videoPlayerController.value.size.width,
                  child: VideoPlayer(videoPlayerController),
                ),
              ),
            )
          : ShimmerLoadingWidget(
              loadingShimmerWidget: SizedBox(
                height: widget.videoHgiht,
                width: widget.videoWidth,
              ),
            ),
    );
  }
}
