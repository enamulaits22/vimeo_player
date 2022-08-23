import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vimeo_player/data/data.dart';
import 'package:vimeo_player/home/cubit/videoplayer_cubit.dart';
import 'package:vimeo_player/widgets/video_card.dart';
class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            BlocConsumer<VideoPlayerCubit, VideoPlayerState>(
              listener: (context, state) {
                if (!state.isSupportedPIP) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sorry your device is not supported PIP mode!'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: BetterPlayer(
                    controller: state.betterPlayerController!,
                    // key: navigatorKey,
                  ),
                );
              },
            ),
            GestureDetector(
              onTap: () async {
                BlocProvider.of<VideoPlayerCubit>(context).enablePictureInPictureMode();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.picture_in_picture_alt, color: Colors.white),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10),
            itemCount: suggestedVideos.length,
            itemBuilder: (context, index) {
              final video = suggestedVideos[index];
              return GestureDetector(
                onTap: () {},
                child: VideoCard(
                  video: video,
                  hasPadding: true,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
