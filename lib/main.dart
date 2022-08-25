import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:vimeo_player/home/cubit/videoplayer_cubit.dart';
import 'package:vimeo_player/home/repository/video_repository.dart';
import 'package:vimeo_player/navigation_bar/view/navigation_bar_page.dart';

final navigatorKey = GlobalKey();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
    debug: true, // optional: set to false to disable printing logs to console (default: true)
    ignoreSsl: true // option: set to false to disable working with http links (default: false)
  );

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
