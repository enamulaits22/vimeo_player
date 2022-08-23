import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vimeo_player/home/cubit/videoplayer_cubit.dart';
import 'package:vimeo_player/home/repository/video_repository.dart';
import 'package:vimeo_player/navigation_bar/view/navigation_bar_page.dart';

final navigatorKey = GlobalKey();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => VideoRepository(),
        ),
      ],
      child: BlocProvider(
        create: (context) => VideoPlayerCubit(videoRepository: VideoRepository()),
        child: MaterialApp(
          title: 'Vimeo Player Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: const NavigationBarPage(),
        ),
      ),
    );
  }
}
