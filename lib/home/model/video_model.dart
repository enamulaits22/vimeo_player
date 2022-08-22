// // To parse this JSON data, do
// //
// //     final videoModel = videoModelFromJson(jsonString);
// import 'dart:convert';

// VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

// String videoModelToJson(VideoModel data) => json.encode(data.toJson());

// class VideoModel {
//     VideoModel({
//         required this.request,
//     });

//     final Request request;

//     factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
//         request: Request.fromJson(json["request"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "request": request.toJson(),
//     };
// }

// class Request {
//     Request({
//         required this.files,
//     });

//     final Files files;

//     factory Request.fromJson(Map<String, dynamic> json) => Request(
//         files: Files.fromJson(json["files"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "files": files.toJson(),
//     };
// }

// class Files {
//     Files({
//         required this.hls,
//     });

//     final Hls hls;

//     factory Files.fromJson(Map<String, dynamic> json) => Files(
//         hls: Hls.fromJson(json["hls"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "hls": hls.toJson(),
//     };
// }

// class Hls {
//     Hls({
//         required this.cdns,
//     });

//     final Cdns cdns;

//     factory Hls.fromJson(Map<String, dynamic> json) => Hls(
//         cdns: Cdns.fromJson(json["cdns"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "cdns": cdns.toJson(),
//     };
// }

// class Cdns {
//     Cdns({
//         required this.akfireInterconnectQuic,
//         required this.fastlySkyfire,
//     });

//     final AkfireInterconnectQuic akfireInterconnectQuic;
//     final AkfireInterconnectQuic fastlySkyfire;

//     factory Cdns.fromJson(Map<String, dynamic> json) => Cdns(
//         akfireInterconnectQuic: AkfireInterconnectQuic.fromJson(json["akfire_interconnect_quic"]),
//         fastlySkyfire: AkfireInterconnectQuic.fromJson(json["fastly_skyfire"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "akfire_interconnect_quic": akfireInterconnectQuic.toJson(),
//         "fastly_skyfire": fastlySkyfire.toJson(),
//     };
// }

// class AkfireInterconnectQuic {
//     AkfireInterconnectQuic({
//         required this.url,
//         required this.origin,
//         required this.captions,
//         required this.avcUrl,
//     });

//     final String? url;
//     final String? origin;
//     final String? captions;
//     final String? avcUrl;

//     factory AkfireInterconnectQuic.fromJson(Map<String, dynamic> json) => AkfireInterconnectQuic(
//         url: json["url"] ?? '',
//         origin: json["origin"] ?? '',
//         captions: json["captions"] ?? '',
//         avcUrl: json["avc_url"] ?? '',
//     );

//     Map<String, dynamic> toJson() => {
//         "url": url!,
//         "origin": origin!,
//         "captions": captions!,
//         "avc_url": avcUrl!,
//     };
// }

// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
    VideoModel({
      required this.request,
      required this.video,
      required this.seo,
    });

    final Request request;
    final Video video;
    final Seo seo;

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        request: Request.fromJson(json["request"]),
        video: Video.fromJson(json["video"]),
        seo: Seo.fromJson(json["seo"]),
    );

    Map<String, dynamic> toJson() => {
        "request": request.toJson(),
        "video": video.toJson(),
        "seo": seo.toJson(),
    };
}

class Request {
    Request({
      required this.files,
    });

    final Files files;

    factory Request.fromJson(Map<String, dynamic> json) => Request(
        files: Files.fromJson(json["files"]),
    );

    Map<String, dynamic> toJson() => {
        "files": files.toJson(),
    };
}

class Files {
    Files({
      required this.hls,
    });

    final Hls hls;

    factory Files.fromJson(Map<String, dynamic> json) => Files(
        hls: Hls.fromJson(json["hls"]),
    );

    Map<String, dynamic> toJson() => {
        "hls": hls.toJson(),
    };
}

class Hls {
    Hls({
      required this.cdns,
    });

    final Cdns cdns;

    factory Hls.fromJson(Map<String, dynamic> json) => Hls(
        cdns: Cdns.fromJson(json["cdns"]),
    );

    Map<String, dynamic> toJson() => {
        "cdns": cdns.toJson(),
    };
}

class Cdns {
    Cdns({
      required this.akfireInterconnectQuic,
      required this.fastlySkyfire,
    });

    final AkfireInterconnectQuic akfireInterconnectQuic;
    final AkfireInterconnectQuic fastlySkyfire;

    factory Cdns.fromJson(Map<String, dynamic> json) => Cdns(
        akfireInterconnectQuic: AkfireInterconnectQuic.fromJson(json["akfire_interconnect_quic"]),
        fastlySkyfire: AkfireInterconnectQuic.fromJson(json["fastly_skyfire"]),
    );

    Map<String, dynamic> toJson() => {
        "akfire_interconnect_quic": akfireInterconnectQuic.toJson(),
        "fastly_skyfire": fastlySkyfire.toJson(),
    };
}

class AkfireInterconnectQuic {
    AkfireInterconnectQuic({
      required this.url,
      required this.origin,
      required this.captions,
      required this.avcUrl,
    });

    final String? url;
    final String? origin;
    final String? captions;
    final String? avcUrl;

    factory AkfireInterconnectQuic.fromJson(Map<String, dynamic> json) => AkfireInterconnectQuic(
        url: json["url"] ?? "",
        origin: json["origin"] ?? "",
        captions: json["captions"] ?? "",
        avcUrl: json["avc_url"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "url": url!,
        "origin": origin!,
        "captions": captions!,
        "avc_url": avcUrl!,
    };
}

class Seo {
    Seo({
      required this.thumbnail,
    });

    final String? thumbnail;

    factory Seo.fromJson(Map<String, dynamic> json) => Seo(
        thumbnail: json["thumbnail"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail!,
    };
}

class Video {
    Video({
      required this.title,
      required this.owner
    });

    final String? title;
    final Owner owner;

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        title: json["title"] ?? "",
        owner: Owner.fromJson(json["owner"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title!,
        "owner": owner.toJson(),
    };
}

class Owner {
    Owner({
      required this.name,
    });

    final String? name;

    factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        name: json["name"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "name": name!,
    };
}