import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:vimeo_player/home/cubit/videoplayer_cubit.dart';
import 'package:vimeo_player/widgets/miniplayer_widget.dart';

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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        handlePlayVideo(state: state, context: context, videoID: "358296408");
                      },
                      child: const Text('video 1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        handlePlayVideo(state: state, context: context, videoID: "560637260");
                      },
                      child: const Text('video 2'),
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
