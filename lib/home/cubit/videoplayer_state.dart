part of 'videoplayer_cubit.dart';

class VideoPlayerState {
  BetterPlayerController? betterPlayerController;
  bool isVideoplaying;
  bool isVisibleMiniPlayer;
  bool isSupportedPIP;
  String videoTitle;
  String videoAuthor;
  
  VideoPlayerState({
    this.betterPlayerController,
    this.isVideoplaying = true,
    this.isVisibleMiniPlayer = false,
    this.isSupportedPIP = true,
    this.videoTitle = '',
    this.videoAuthor = '',
  });
}

// part of 'videoplayer_cubit.dart';

// class VideoPlayerState extends Equatable {  
//   const VideoPlayerState({
//     this.betterPlayerController,
//     this.isVideoplaying = true,
//     this.isVisibleMiniPlayer = false,
//     this.isSupportedPIP = true,
//     this.videoTitle = '',
//     this.videoAuthor = '',
//   });
//     final BetterPlayerController? betterPlayerController;
//     final bool isVideoplaying;
//     final bool isVisibleMiniPlayer;
//     final bool isSupportedPIP;
//     final String videoTitle;
//     final String videoAuthor;

//     VideoPlayerState copywith({
//       BetterPlayerController? betterPlayerController,
//       bool? isVideoplaying,
//       bool? isVisibleMiniPlayer,
//       bool? isSupportedPIP,
//       String? videoTitle,
//       String? videoAuthor,
//     }) {
//       return VideoPlayerState(
//         betterPlayerController: betterPlayerController ?? this.betterPlayerController,
//         isVideoplaying:  isVideoplaying ?? this.isVideoplaying,
//         isVisibleMiniPlayer: isVisibleMiniPlayer ?? this.isVisibleMiniPlayer,
//         isSupportedPIP: isSupportedPIP ?? this.isSupportedPIP,
//         videoTitle: videoTitle ?? this.videoTitle,
//         videoAuthor: videoAuthor ?? this.videoAuthor,
//       );
//     }
//     @override
//     List<Object> get props => [
//       betterPlayerController!,
//       isVideoplaying,
//       isVisibleMiniPlayer,
//       isSupportedPIP,
//       videoTitle,
//       videoAuthor,
//     ];
// }
