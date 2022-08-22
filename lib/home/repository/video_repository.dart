import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:vimeo_player/home/model/video_model.dart';

class VideoRepository {
  Future<VideoModel> getVideoInformation({required String videoId}) async {
    Uri url = Uri.parse('https://player.vimeo.com/video/$videoId/config');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      log(response.body);
      log('================================ Fetch video informatiob successful!!!');
      final videoInfo = videoModelFromJson(response.body);
      return videoInfo;
    } else {
      log('Failed to call!!!');
      throw Exception("Failed to load video information");
    }
  }
}
