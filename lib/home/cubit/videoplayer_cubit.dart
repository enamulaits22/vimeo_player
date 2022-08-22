import 'dart:developer';
import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vimeo_player/home/model/video_model.dart';
import 'package:vimeo_player/home/repository/video_repository.dart';
import 'package:vimeo_player/main.dart';
part 'videoplayer_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit({required this.videoRepository}) : super(VideoPlayerState());

  final VideoRepository videoRepository;

  late BetterPlayerController betterPlayerController;

  Future<void> setUpVideoPlayer({required String videoId}) async {
    try {
      final VideoModel videoInformation = await videoRepository.getVideoInformation(videoId: videoId);
      String videoUrl = videoInformation.request.files.hls.cdns.akfireInterconnectQuic.url.toString();
      String title = videoInformation.video.title.toString();
      String author = videoInformation.video.owner.name.toString();
      String thumbImgUrl = videoInformation.seo.thumbnail.toString();
      
      BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        videoUrl,
        notificationConfiguration: BetterPlayerNotificationConfiguration(
        showNotification: true,
        title: title,
        author: author,
        imageUrl: thumbImgUrl,
        activityName: "MainActivity",
      ),
      );

      betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(
          autoPlay: true,
          autoDispose: false,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            enablePip: true,
            pipMenuIcon: Icons.picture_in_picture,
            // showControls: false,
          ),
        ),
        betterPlayerDataSource: betterPlayerDataSource,
      );
      // betterPlayerController.dispose(forceDispose: true);
      emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVisibleMiniPlayer: true));
    } on Exception catch (e) {
      if (e is SocketException) {
        log('Check Your Internet!!!');
      }
    }
  }

  Future<void> forceDisposeVideo() async {
    betterPlayerController.dispose(forceDispose: true);
    // betterPlayerController = null;
    emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVideoplaying: false, isVisibleMiniPlayer: false));
  }
  
  Future<void> checkIsVideoPlaying() async {
    bool? isPlaying = betterPlayerController.isPlaying();
    if (isPlaying!) {
      emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVideoplaying: false, isVisibleMiniPlayer: true));
      betterPlayerController.pause();
    } else {
      emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVideoplaying: true, isVisibleMiniPlayer: true));
      betterPlayerController.play();
    }
  }
  
  // Future<void> pauseVideo() async {
  //   var isPlaying;
  //   if (betterPlayerController != null) {
  //     isPlaying = await betterPlayerController.isPlaying();
  //   }
  //   if (isPlaying == true) {
  //     emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVideoplaying: false));
  //     betterPlayerController.pause();
  //   }
  // }

  void enablePictureInPictureMode() async {
    bool res = await state.betterPlayerController!.isPictureInPictureSupported();
    if (res) {
      await state.betterPlayerController!.enablePictureInPicture(navigatorKey);
    } else {
      emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVisibleMiniPlayer: true, isSupportedPIP: false));
    }
  }
}
