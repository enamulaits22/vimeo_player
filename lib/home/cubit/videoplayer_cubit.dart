import 'dart:developer';
import 'dart:io';

import 'package:better_player/better_player.dart';
// import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
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
      String downloadUrl = videoInformation.request.files.progressive![0].url.toString();
      
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
      emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVisibleMiniPlayer: true, videoTitle: title, videoAuthor: author, downloadUrl: downloadUrl));
    } on Exception catch (e) {
      if (e is SocketException) {
        log('Check Your Internet!!!');
      }
    }
  }

  Future<void> forceDisposeVideo() async {
    betterPlayerController.dispose(forceDispose: true);
    // betterPlayerController = null;
    emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVideoplaying: false, isVisibleMiniPlayer: false, downloadUrl: state.downloadUrl));
  }
  
  Future<void> checkIsVideoPlaying() async {
    bool? isPlaying = betterPlayerController.isPlaying();
    if (isPlaying!) {
      emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVideoplaying: false, isVisibleMiniPlayer: true, videoTitle: state.videoTitle, videoAuthor: state.videoAuthor, downloadUrl: state.downloadUrl));
      betterPlayerController.pause();
    } else {
      emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVideoplaying: true, isVisibleMiniPlayer: true, videoTitle: state.videoTitle, videoAuthor: state.videoAuthor, downloadUrl: state.downloadUrl));
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

  Future<void> enablePictureInPictureMode() async {
    bool res = await state.betterPlayerController!.isPictureInPictureSupported();
    if (res) {
      await state.betterPlayerController!.enablePictureInPicture(navigatorKey);
    } else {
      emit(VideoPlayerState(betterPlayerController: betterPlayerController, isVisibleMiniPlayer: true, isSupportedPIP: false, videoTitle: state.videoTitle, videoAuthor: state.videoAuthor, downloadUrl: state.downloadUrl));
    }
  }
  Future<void> downloadVideo() async {
    var status = await Permission.storage.request();
    if (status.isGranted) {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      await FlutterDownloader.enqueue(
        url: state.downloadUrl,
        savedDir: appDocPath,
        showNotification: true, // show download progress in status bar (for Android)
        openFileFromNotification: true, // click on notification to open downloaded file (for Android)
        saveInPublicStorage: true,
      );
    }
  }
}


// import 'dart:developer';
// import 'dart:io';

// import 'package:better_player/better_player.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:vimeo_player/home/model/video_model.dart';
// import 'package:vimeo_player/home/repository/video_repository.dart';
// import 'package:vimeo_player/main.dart';
// part 'videoplayer_state.dart';

// class VideoPlayerCubit extends Cubit<VideoPlayerState> {
//   VideoPlayerCubit({required this.videoRepository}) : super(const VideoPlayerState());

//   final VideoRepository videoRepository;

//   late BetterPlayerController betterPlayerController;

//   Future<void> setUpVideoPlayer({required String videoId}) async {
//     try {
//       final VideoModel videoInformation = await videoRepository.getVideoInformation(videoId: videoId);
//       String videoUrl = videoInformation.request.files.hls.cdns.akfireInterconnectQuic.url.toString();
//       String title = videoInformation.video.title.toString();
//       String author = videoInformation.video.owner.name.toString();
//       String thumbImgUrl = videoInformation.seo.thumbnail.toString();
      
//       BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
//         BetterPlayerDataSourceType.network,
//         videoUrl,
//         notificationConfiguration: BetterPlayerNotificationConfiguration(
//         showNotification: true,
//         title: title,
//         author: author,
//         imageUrl: thumbImgUrl,
//         activityName: "MainActivity",
//       ),
//       );

//       betterPlayerController = BetterPlayerController(
//         const BetterPlayerConfiguration(
//           autoPlay: true,
//           autoDispose: false,
//           controlsConfiguration: BetterPlayerControlsConfiguration(
//             enablePip: true,
//             pipMenuIcon: Icons.picture_in_picture,
//             // showControls: false,
//           ),
//         ),
//         betterPlayerDataSource: betterPlayerDataSource,
//       );
//       // betterPlayerController.dispose(forceDispose: true);
//       log(':::::::::::::::${state.isVisibleMiniPlayer.toString()}');
//       emit(state.copywith(betterPlayerController: betterPlayerController, isVisibleMiniPlayer: true, videoTitle: title, videoAuthor: author));
//       log(state.videoTitle.toString());
//     } on Exception catch (e) {
//       if (e is SocketException) {
//         log('Check Your Internet!!!');
//       }
//     } catch(e){
//       log(e.toString());
//     }
//   }

//   Future<void> forceDisposeVideo() async {
//     betterPlayerController.dispose(forceDispose: true);
//     // betterPlayerController = null;
//     emit(state.copywith(isVideoplaying: false, isVisibleMiniPlayer: false));
//   }
  
//   Future<void> checkIsVideoPlaying() async {
//     bool? isPlaying = betterPlayerController.isPlaying();
//     if (isPlaying!) {
//       emit(state.copywith(isVideoplaying: false));
//       betterPlayerController.pause();
//     } else {
//       emit(state.copywith(isVideoplaying: true));
//       betterPlayerController.play();
//     }
//   }

//   void enablePictureInPictureMode() async {
//     bool res = await state.betterPlayerController!.isPictureInPictureSupported();
//     if (res) {
//       await state.betterPlayerController!.enablePictureInPicture(navigatorKey);
//     } else {
//       emit(state.copywith(isSupportedPIP: false));
//     }
//   }
// }
