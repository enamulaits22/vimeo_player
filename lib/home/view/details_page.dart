import 'dart:isolate';
import 'dart:ui';

import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:vimeo_player/data/data.dart';
import 'package:vimeo_player/home/cubit/videoplayer_cubit.dart';
import 'package:vimeo_player/widgets/video_card.dart';
class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  ReceivePort _port = ReceivePort();

@override
void initState() {
  super.initState();

  IsolateNameServer.registerPortWithName(_port.sendPort, 'downloader_send_port');
  _port.listen((dynamic data) {
    String id = data[0];
    DownloadTaskStatus status = data[1];
    int progress = data[2];
    setState((){ });
  });

  FlutterDownloader.registerCallback(downloadCallback);
}

@override
void dispose() {
  IsolateNameServer.removePortNameMapping('downloader_send_port');
  super.dispose();
}

@pragma('vm:entry-point')
static void downloadCallback(String id, DownloadTaskStatus status, int progress) {
  final SendPort? send = IsolateNameServer.lookupPortByName('downloader_send_port');
  send!.send([id, status, progress]);
}
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
        GestureDetector(
          onTap: () async {
            BlocProvider.of<VideoPlayerCubit>(context).downloadVideo();
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.download, color: Colors.white),
          ),
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
