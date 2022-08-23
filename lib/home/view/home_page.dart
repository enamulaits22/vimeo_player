import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:vimeo_player/data/data.dart';
import 'package:vimeo_player/home/cubit/videoplayer_cubit.dart';
import 'package:vimeo_player/widgets/custom_appbar.dart';
import 'package:vimeo_player/widgets/miniplayer_widget.dart';
import 'package:vimeo_player/widgets/video_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MiniplayerController controller = MiniplayerController();
  final double _playerMinHeight = 70;
  int miliseconds = 200;

  @override
  Widget build(BuildContext context) {
    return MiniplayerWillPopScope(
      onWillPop: () async {
        // final NavigatorState navigator = navigatorKey.currentState;
        if (!Navigator.of(context).canPop()) return true;
        Navigator.of(context).pop();
        return false;
      },
      child: Stack(
        children: [
          BlocBuilder<VideoPlayerCubit, VideoPlayerState>(
            builder: (context, state) {
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    const CustomSliverAppBar(),
                    SliverPadding(
                      padding: const EdgeInsets.only(bottom: 60.0),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final video = videos[index];
                            return GestureDetector(
                              onTap: () {
                                handlePlayVideo(
                                  state: state,
                                  context: context,
                                  videoID: video.id,
                                );
                              },
                              child: VideoCard(video: video),
                            );
                          },
                          childCount: videos.length,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Stack(
            children: [
              Positioned(
                // bottom: 40,
                child: MiniPlayerWidget(
                  miniplayerController: controller,
                  miniplayerHeight: _playerMinHeight,
                  onTapCancel: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void handlePlayVideo({
    required VideoPlayerState state,
    required BuildContext context,
    required String videoID,
  }) {
    if (state.isVisibleMiniPlayer) {
      BlocProvider.of<VideoPlayerCubit>(context).forceDisposeVideo();
    }
    BlocProvider.of<VideoPlayerCubit>(context).setUpVideoPlayer(videoId: videoID).then((value) {
      Future.delayed(Duration(milliseconds: miliseconds), () {
        controller.animateToHeight(state: PanelState.MAX);
        miliseconds = 50;
      });
    });
  }
}
